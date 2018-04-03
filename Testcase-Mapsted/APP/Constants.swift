//
//  Constants.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Foundation

struct Constants {
    #if DEBUG
    static let baseURL = "http://jobs.mapsted.com/api"
    #else
    #endif
    
}

enum Errors: Error {
    case invalidURL
}
