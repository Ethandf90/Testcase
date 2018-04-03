//
//  APIRouterProtocol.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Alamofire

/// protocol for Routers
protocol APIRouterProtocol: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var queryItems: [URLQueryItem]? { get }
}

