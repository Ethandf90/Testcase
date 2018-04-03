//
//  BuildingTableViewCell.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import UIKit



class BuildingTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    fileprivate var model: Building? = nil {
        didSet {
            if let model = model {
                idLabel.text = "id: \(model.id)"
                nameLabel.text = "name: \(model.name)"
                cityLabel.text = "city: \(model.city)"
                stateLabel.text = "state: \(model.state)"
                countryLabel.text = "nation: \(model.country.rawValue)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateContent(with model: Building) {
        self.model = model
    }

}
