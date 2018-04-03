//
//  Purchase.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Foundation

struct Purchase: Decodable {
    let item_id: Int
    let item_category_id: Int
    let cost: Double
    
    enum CodingKeys: String, CodingKey {
        case item_id
        case item_category_id
        case cost
    }
}
