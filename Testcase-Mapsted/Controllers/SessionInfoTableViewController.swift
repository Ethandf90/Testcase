//
//  SessionInfoTableViewController.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import UIKit

// use default tableViewCell to show data
// each building_id is related to a section
class SessionInfoTableViewController: UITableViewController {

    var modelArray: [SessionInfo] = [SessionInfo]()
    
    convenience init(modelArray: [SessionInfo]) {
        self.init()
        
        self.title = "Analytics"
        self.modelArray = modelArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return modelArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray[section].purchases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")

        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "reuseIdentifier")
        }
        
        let item_category_id = modelArray[indexPath.section].purchases[indexPath.row].item_category_id
        let item_id = modelArray[indexPath.section].purchases[indexPath.row].item_id
        let cost = modelArray[indexPath.section].purchases[indexPath.row].cost
        
        cell?.textLabel?.text = "item_id: \(item_id)  item_category_id: \(item_category_id)"
        cell?.detailTextLabel?.text = "cost: \(cost)"
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Building id: \(modelArray[section].building_id)"
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
