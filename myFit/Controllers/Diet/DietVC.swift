//
//  EatingVC.swift
//  Fit
//
//  Created by C4Q on 5/30/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class DietVC: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	let sectionTitles: [String] = ["Breakfast", "Lunch", "Dinner", "Snacks", "Liquids"]
	var sectionImages: [UIImage] = [#imageLiteral(resourceName: "breakfast"), #imageLiteral(resourceName: "lunch"), #imageLiteral(resourceName: "dinner"), #imageLiteral(resourceName: "snacks"), #imageLiteral(resourceName: "drinks")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViews()

    }
    
    private func setupTableViews(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}


// MARK: TableView Datasource
extension DietVC: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return sectionTitles.count
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderCell
		cell.configureCell(image: sectionImages[section], labelText: sectionTitles[section])
		return cell
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 50
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
		-> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodCell
			cell.configureCell(image: #imageLiteral(resourceName: "user2"), foodName: "Eggs", quantity: 2, calories: 120)
			return cell
	}

}


// MARK: TableView Delegate
extension DietVC: UITableViewDelegate {


}




