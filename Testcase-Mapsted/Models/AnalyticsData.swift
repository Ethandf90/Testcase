//
//  AnalyticsData.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Foundation

struct AnalyticsData: Decodable {
    let manufacturer: String
    let marketName: String
    let codename: String
    let model: String
    let sessionInfos: [SessionInfo]
    
    enum CodingKeys: String, CodingKey {
        case manufacturer
        case market_name = "market_name"
        case codename
        case model
        case usage_statistics
    }
    
    enum Usage_statisticsKeys: String, CodingKey {
        case sessionInfos = "session_infos"
    }
}

extension AnalyticsData {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        manufacturer = try values.decode(String.self, forKey: .manufacturer)
        marketName = try values.decode(String.self, forKey: .market_name)
        codename = try values.decode(String.self, forKey: .codename)
        model = try values.decode(String.self, forKey: .model)
        // for the nested session_infos
        let usageInfo = try values.nestedContainer(keyedBy: Usage_statisticsKeys.self, forKey: .usage_statistics)
        sessionInfos = try usageInfo.decode(Array<SessionInfo>.self, forKey: .sessionInfos)
    }
}
