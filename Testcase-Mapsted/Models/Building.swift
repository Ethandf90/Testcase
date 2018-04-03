//
//  Building.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Foundation

/// CountryType for country property of Building (assuming api returns no other countries)
enum CountryType: String, Decodable {
    case canada = "Canada"
    case usa = "United States"
}

struct Building: Decodable {
    let id: Int
    let name: String
    let city: String
    let state: String
    let country: CountryType
    
    enum CodingKeys: String, CodingKey {
        case id = "building_id"
        case name = "building_name"
        case city
        case state
        case country
    }
}
