//
//  MapstedRouter.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Alamofire

enum MapstedRouter: APIRouterProtocol {
    
    case buildings
    case analytics
    
    internal var method: HTTPMethod {
        switch self {
        case .buildings, .analytics:
            return .get
        }
    }
    
    internal var path: String {
        switch self {
        case .buildings:
            return "/Values/GetBuildingData"
        case .analytics:
            return "/Values/GetAnalyticsData"
        }
    }
    
    internal var queryItems: [URLQueryItem]? {
        switch self {
        case .buildings, .analytics:
            return nil
        }
    }
    
    internal var parameters: Parameters? {
        switch self {
        case .buildings, .analytics:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var urlComponent = URLComponents(string: Constants.baseURL + path)
        
        if let query = queryItems {
            urlComponent?.queryItems = query
        }
        
        guard let url = urlComponent?.url else { throw Errors.invalidURL }
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
