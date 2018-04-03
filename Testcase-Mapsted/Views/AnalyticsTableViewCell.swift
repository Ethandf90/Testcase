//
//  AnalyticsTableViewCell.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import UIKit

class AnalyticsTableViewCell: UITableViewCell {

    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var marketLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var mdoelLabel: UILabel!
    
    var model: AnalyticsData? = nil {
        didSet {
            if let model = model {
                manufacturerLabel.text = "manufacturer: \(model.manufacturer)"
                marketLabel.text = "market: \(model.marketName)"
                codeLabel.text = "code: \(model.codename)"
                mdoelLabel.text = "model: \(model.model)"
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateContent(with model: AnalyticsData) {
        self.model = model
    }
}
