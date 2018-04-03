//
//  DataManager.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    // leave the fetched data here, as they will be used in multiple places
    var buildings: [Building]?
    var analyticsData: [AnalyticsData]?
    
    // MARK: public func
    
    func setBuildings(with array: [Building]) {
        buildings = array
    }
    
    func setAnalyticsData(with array: [AnalyticsData]) {
        analyticsData = array
    }
    
    /// Total purchase costs for Samsung manufacture devices
    func getTotalPurchaseCosts(of manufacture: String) -> Double {
        if let _ = buildings, let analyticsData = analyticsData {
            let value = analyticsData.filter { $0.manufacturer == manufacture} // filteredSamsungArr
                                    .flatMap { $0.sessionInfos }.flatMap { $0.purchases } // allPurchases
                                    .compactMap { $0.cost }.reduce(0) { $0 + $1 }
            
            return round(100 * value) / 100  // two decimal places
        } else {
            return -1
        }
    }
    
    /// Total number of times item (item_id = 47) was purchased
    func totalTimesPurchased(of itemId: Int) -> Int{
        if let _ = buildings, let analyticsData = analyticsData {
            
            let filteredArr = analyticsData.flatMap { $0.sessionInfos }.flatMap { $0.purchases }
                .filter { $0.item_id == itemId }
            
            return filteredArr.count  // two decimal places
        } else {
            return -1
        }
    }
    
    /// Total purchase costs for item’s in the category (item_category_id = 7)
    func totalCostOnItemCategory(of id: Int) -> Double {
        if let _ = buildings, let analyticsData = analyticsData {
            
            let result = analyticsData.flatMap { $0.sessionInfos }.flatMap { $0.purchases }
                                        .filter { $0.item_category_id == id }
                                        .compactMap { $0.cost }.reduce(0) { $0 + $1 }
            
            return round(100 * result) / 100  // two decimal places
        } else {
            return -1
        }
    }
    
    /// Total purchase costs in Ontario
    func totalPurchaseCost(in state: String) -> Double {
        if let buildings = buildings, let analyticsData = analyticsData {
            // get all building ids of ON
            let filteredBuildings = buildings.filter { $0.state == state}
            let id_set = Set(filteredBuildings.map { $0.id })
            // total cost
            let result = analyticsData.flatMap { $0.sessionInfos }
                                    .filter { id_set.contains($0.building_id) }
                                    .flatMap { $0.purchases }
                                    .compactMap { $0.cost }.reduce(0) { $0 + $1 }
            
            return round(100 * result) / 100  // two decimal places
        } else {
            return -1
        }
    }
    
    /// Total purchase costs in the United States
    func totalPurchaseCost(in nation: CountryType) -> Double {
        if let buildings = buildings, let analyticsData = analyticsData {
            // get all building ids of ON
            let filteredBuildings = buildings.filter { $0.country == nation}
            let id_set = Set(filteredBuildings.map { $0.id })
            // total cost
            let result = analyticsData.flatMap { $0.sessionInfos }
                .filter { id_set.contains($0.building_id) }
                .flatMap { $0.purchases }
                .compactMap { $0.cost }.reduce(0) { $0 + $1 }
          
            return round(100 * result) / 100  // two decimal places
        } else {
            return -1
        }
    }
    
    /// Which building (name or id) has the most total purchase costs?
    ///
    /// - Returns: building_id
    func getBuildingWithMostTotalCost() -> Int {
        if let _ = buildings, let analyticsData = analyticsData {
            // dic: [building_id: [Purchases]] - building_id as key, and related purchase array as value
            let dic = analyticsData.flatMap { $0.sessionInfos }.reduce(into: [Int: [Purchase]](), { (dic, sessionInfo) in
                dic[sessionInfo.building_id] =
                    dic[sessionInfo.building_id, default: []] + sessionInfo.purchases
            })
        
            // resultDic: [building_id: totalCost]
            let resultDic = dic.reduce(into: [Int: Double]()) { (tempDic, pair) in
                tempDic[pair.key] = pair.value.compactMap { $0.cost }.reduce(0) { $0 + $1 }
            }
            
            if let resultPair = resultDic.max(by: { $0.value < $1.value }) {
                return resultPair.key
            } else {
                return -1   // there might be two equal largest
            }
            
        } else {
            return -1
        }
    }
}
