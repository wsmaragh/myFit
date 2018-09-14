//
//  WorkoutVC.swift
//  myFit
//
//  Created by Winston Maragh on 8/16/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class WorkoutVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections: [String] = ["Exercises By Muscle: ", "My Workouts: ", "Suggested Workouts: ", "Fitness News: "]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        testData()
    }
    
    deinit {
        print("de-init: WorkoutVC - memory cleared")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func testData(){
        
    }
    
}



// MARK: TableView Holding Cells for CollectionViews
extension WorkoutVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: aHoldingCell.id, for: indexPath) as! aHoldingCell
            cell.viewController = self
            cell.configureCell(forCell: cell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: bHoldingCell.id, for: indexPath) as! bHoldingCell
            cell.viewController = self
            cell.configureCell(forCell: cell)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: cHoldingCell.id, for: indexPath) as! cHoldingCell
            cell.viewController = self
            cell.configureCell(forCell: cell)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: dHoldingCell.id, for: indexPath) as! dHoldingCell
            cell.viewController = self
            cell.configureCell(forCell: cell)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { return 100 }
        if indexPath.section == 3 { return 270 }
        return 210
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section <= sections.count else {return "No Section Header"}
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "TimesNewRomanPSMT", size: 15.0)
        header.textLabel?.textAlignment = .left
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerCell = tableView.dequeueReusableCell(withIdentifier: Storyboard.headerCell)            as! HeaderCell
//        headerCell.configure(sectionHeader: sections[section])
//        //        headerCell?.viewController = self
//        return headerCell
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 3.0
    }
    
}
