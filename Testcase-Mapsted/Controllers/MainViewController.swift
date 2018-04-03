//
//  MainViewController.swift
//  Testcase-Mapsted
//
//  Created by FEI DONG on 2018-04-02.
//  Copyright © 2018 FEI DONG. All rights reserved.
//

import UIKit
import SnapKit

// UI is made by code, only to demonstrate
class MainViewController: UIViewController {

    // MARK: properties
    
    fileprivate var isLoading = false {
        didSet {
            toggleSpinner(isloading: isLoading)
            answer1Label.text = String(DataManager.shared.getTotalPurchaseCosts(of: "Samsung"))
            answer2Label.text = String(DataManager.shared.totalTimesPurchased(of: 47))
            answer3Label.text = String(DataManager.shared.totalCostOnItemCategory(of: 7))
            answer4Label.text = String(DataManager.shared.totalPurchaseCost(in: "Ontario"))
            answer5Label.text = String(DataManager.shared.totalPurchaseCost(in: .usa))
            answer6Label.text = String(DataManager.shared.getBuildingWithMostTotalCost())
        }
    }
    
    // MARK: subviews
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(frame: CGRect.zero)
        spinner.activityIndicatorViewStyle = .gray
        
        return spinner
    }()
    
    lazy var buildingButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setTitle("Buildings", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(buildingButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var analyticsButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setTitle("Analytics Data", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(analyticsButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var question1Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Total purchase costs for Samsung manufacture devices"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var answer1Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var question2Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Total number of times item (item_id = 47) was purchased"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var answer2Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var question3Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Total purchase costs for item’s in the category (item_category_id = 7)"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var answer3Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var question4Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Total purchase costs in Ontario"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var answer4Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var question5Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Total purchase costs in the United States"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var answer5Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var question6Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Which building (name or id) has the most total purchase costs?"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var answer6Label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.textColor = .darkGray
        
        return label
    }()
    
    // MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main page"

        addSubviews()
        addConstraints()
        loadData()
    }
    
    // MARK: private function
    
    fileprivate func toggleSpinner(isloading: Bool) {
        if isloading {
            view.subviews.forEach { $0.isHidden = true }
            spinner.startAnimating()
            spinner.isHidden = false
            
        } else {
            view.subviews.forEach { $0.isHidden = false }
            spinner.stopAnimating()
            spinner.isHidden = true
        }
    }

    // MARK: action events
    
    @objc func buildingButtonClicked() {
        let vc = BuildingTableViewController(modelArray: DataManager.shared.buildings!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func analyticsButtonClicked() {
        let vc = AnalyticsTableViewController(modelArray: DataManager.shared.analyticsData!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: ViewControllerProtocol {
    func addSubviews() {
        view.addSubview(spinner)
        view.addSubview(buildingButton)
        view.addSubview(analyticsButton)
        
        view.addSubview(question1Label)
        view.addSubview(answer1Label)
        view.addSubview(question2Label)
        view.addSubview(answer2Label)
        view.addSubview(question3Label)
        view.addSubview(answer3Label)
        view.addSubview(question4Label)
        view.addSubview(answer4Label)
        view.addSubview(question5Label)
        view.addSubview(answer5Label)
        view.addSubview(question6Label)
        view.addSubview(answer6Label)
    }
    
    func addConstraints() {
        spinner.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.centerX.centerY.equalToSuperview()
        }
        buildingButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        analyticsButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(buildingButton.snp.bottom).offset(50)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        question1Label.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(answer1Label.snp.top).offset(-5)
        }
        answer1Label.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(question2Label.snp.top).offset(-10)
        }
        question2Label.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(answer2Label.snp.top).offset(-5)
        }
        answer2Label.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(question3Label.snp.top).offset(-10)
        }
        question3Label.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(answer3Label.snp.top).offset(-5)
        }
        answer3Label.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(question4Label.snp.top).offset(-10)
        }
        question4Label.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(answer4Label.snp.top).offset(-5)
        }
        answer4Label.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(question5Label.snp.top).offset(-10)
        }
        question5Label.snp.makeConstraints { (make) in
            make.height.equalTo(25)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(answer5Label.snp.top).offset(-5)
        }
        answer5Label.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(question6Label.snp.top).offset(-10)
        }
        question6Label.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(answer6Label.snp.top).offset(-5)
        }
        answer6Label.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func loadData() {
        isLoading = true
        let group = DispatchGroup()
        
        group.enter()
        MapstedAPIServices.getBuildings { (result) in
            switch result {
            case .success(let buildings):
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
                DataManager.shared.setAnalyticsData(with: data)
            case .failure(let error):
                print(error)
            }
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) { [unowned self] in
            // All async calls were completed, so notify the main thread to go ahead with UI changes
            self.isLoading = false
        }
    }
}
