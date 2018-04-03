//
//  SessionInfo.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Foundation

struct SessionInfo: Decodable {
    let building_id: Int
    let purchases: [Purchase]
    
    enum CodingKeys: String, CodingKey {
        case building_id
        case purchases
    }
}
