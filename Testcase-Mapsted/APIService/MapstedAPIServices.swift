//
//  MapstedAPIServices.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Alamofire

class MapstedAPIServices: APIServiceProtocol {
    
    static func getBuildings(with completion: @escaping (Result<[Building]>) -> Void) {
        performRequest(route: MapstedRouter.buildings, completion: completion)
    }

    static func getAnalyticsData(with completion: @escaping (Result<[AnalyticsData]>) -> Void) {
        performRequest(route: MapstedRouter.analytics, completion: completion)
    }
    
}
