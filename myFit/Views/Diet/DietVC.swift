//
//  EatingVC.swift
//  Fit
//
//  Created by Winston Marag on 9/10/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class DietVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    deinit {
        
    }
    
	let sectionTitles: [String] = ["Breakfast", "Lunch", "Dinner", "Snacks", "Liquids"]
//    let sections :
    
    var recipes = [Recipe]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var sampleBreakfast = DummyData.sampleFoodBreakfast
    var sampleLunch = DummyData.sampleFoodLunch
    var sampleDinner = DummyData.sampleFoodDinner
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableViews()
        fetchData()
    }
    
    private func setupTableViews(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        let cellSpacing: CGFloat = 5.0
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: 0.0)
        let numberOfItemsPerRow: CGFloat = 3.1
        let numSpaces: CGFloat = numberOfItemsPerRow + 1
        let screenWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numberOfItemsPerRow, height: collectionView.bounds.height)
    }
    
    private func fetchData(){
        RecipeAPIService.shared.fetchRecipes(with: "healthy", dietHealthCriteria: DietHealthCriteria.LowFat) {[unowned self] (onlineRecipes) in
            self.recipes = onlineRecipes
            self.collectionView.isHidden = false
        }
    }

}



// MARK:- CollectionView
extension DietVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCell.id, for: indexPath) as! RecipeCell
        let recipe = recipes[indexPath.item]
        cell.configureCell(recipe: recipe)
        cell.layer.cornerRadius = 16
        return cell
    }
    
}



// MARK:- TableView
extension DietVC: UITableViewDataSource, UITableViewDelegate {

	func numberOfSections(in tableView: UITableView) -> Int {
		return sectionTitles.count
	}

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.id) as! HeaderCell
//        cell.configureCell(headerLabelStr: sectionTitles[section])
//        return cell
//    }

    // Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CollapsibleHeader.id) as? CollapsibleHeader ?? CollapsibleHeader(reuseIdentifier: CollapsibleHeader.id)
        let sectionTitle = sectionTitles[section]
        header.configureCell(section: sectionTitle)
        header.setCollapsed(false)
//        header.setCollapsed(sections[section].collapsed)
        header.section = section
        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sampleBreakfast.count
        } else if section == 1 {
            return sampleLunch.count
        } else if section == 2 {
            return sampleDinner.count
        }
		return 2
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
		-> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell.id) as! FoodCell
            if indexPath.section == 0 {
                let food = sampleBreakfast[indexPath.row]
                cell.configureCell(food: food)
            } else if indexPath.section  == 1 {
                let food = sampleLunch[indexPath.row]
                cell.configureCell(food: food)
            } else if indexPath.section  == 2 {
                let food = sampleDinner[indexPath.row]
                cell.configureCell(food: food)
            }
            return cell
	}

}



// MARK: - Section Header Delegate
extension DietVC: CollapsibleHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleHeader, section: Int) {
//        let collapsed = !sections[section].collapsed
//        sections[section].collapsed = collapsed
//        header.setCollapsed(collapsed)
//        customView.tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
