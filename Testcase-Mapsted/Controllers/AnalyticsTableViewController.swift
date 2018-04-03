//
//  AnalyticsTableViewController.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import UIKit

struct AnalyticsTableViewControllerConst {
    static let cellIdentifier = "cellIdentifier"
    static let tableCellHeight = 100
}

class AnalyticsTableViewController: UITableViewController {

    var modelArray: [AnalyticsData] = [AnalyticsData]()
    
    convenience init(modelArray: [AnalyticsData]) {
        self.init()
        
        self.title = "Analytics"
        self.modelArray = modelArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "AnalyticsTableViewCell", bundle: nil), forCellReuseIdentifier: AnalyticsTableViewControllerConst.cellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnalyticsTableViewControllerConst.cellIdentifier, for: indexPath) as! AnalyticsTableViewCell

        cell.updateContent(with: modelArray[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SessionInfoTableViewController(modelArray: modelArray[indexPath.row].sessionInfos)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
