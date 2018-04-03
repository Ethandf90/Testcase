//
//  BuildingTableViewController.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import UIKit

struct BuildingTableViewControllerConst {
    static let cellIdentifier = "cellIdentifier"
    static let tableCellHeight = 100
}

class BuildingTableViewController: UITableViewController {

    var modelArray: [Building] = [Building]()
    
    convenience init(modelArray: [Building]) {
        self.init()
        
        self.title = "Buildings"
        self.modelArray = modelArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "BuildingTableViewCell", bundle: nil), forCellReuseIdentifier: BuildingTableViewControllerConst.cellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BuildingTableViewControllerConst.cellIdentifier, for: indexPath) as! BuildingTableViewCell
        cell.updateContent(with: modelArray[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(BuildingTableViewControllerConst.tableCellHeight)
    }

}
