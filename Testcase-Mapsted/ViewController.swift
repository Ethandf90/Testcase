//
//  ViewController.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import UIKit

// for testing
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData() {
        let group = DispatchGroup()
        
        group.enter()
        MapstedAPIServices.getBuildings { (result) in
            switch result {
            case .success(let buildings):
//                print("_____________________________")
//                print(buildings)
                DataManager.shared.setBuildings(with: buildings)
            case .failure(let error):
                print(error)
            }
            group.leave()
        }
        
        group.enter()
        MapstedAPIServices.getAnalyticsData { (result) in
            switch result {
            case .success(let data):
//                print("_____________________________")
//                print(data[0])
                DataManager.shared.setAnalyticsData(with: data)
            case .failure(let error):
                print(error)
            }
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {
            // All async calls were completed, so notify the main thread to go ahead with UI changes
            DataManager.shared.getBuildingWithMostTotalCost()
        }
    }
    
    
}

