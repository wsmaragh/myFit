//
//  TableCellForCollectionView.swift
//  Fit
//
//  Created by Winston Maragh on 6/8/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//


import UIKit

class TableCellForCollectionView: UITableViewCell {

	@IBOutlet weak var headerTitle: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!

	// data
	var images  = [[#imageLiteral(resourceName: "workout_empty"), #imageLiteral(resourceName: "workout_filled"), #imageLiteral(resourceName: "events_filled")], [#imageLiteral(resourceName: "photo-bubble-placeholder-icon"), #imageLiteral(resourceName: "favList"), #imageLiteral(resourceName: "add_filled"), #imageLiteral(resourceName: "base-message-failed-icon"), #imageLiteral(resourceName: "events_filled")], [#imageLiteral(resourceName: "progress_filled"), #imageLiteral(resourceName: "eat_filled")]]
    var workouts: 
    let workoutCell = "WorkoutCell"


	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func configureCollectionView(forCell cell: TableCellForCollectionView, forIndexPath indexPath: IndexPath) {
		cell.collectionView.delegate = self
		cell.collectionView.dataSource = self
        
//        let workoutCellNib = UINib(nibName: workoutCell, bundle: nil)
//        workoutCV.register(workoutCellNib, forCellWithReuseIdentifier: workoutCell)
//
//        let sectionHeaderViewNib = UINib(nibName: sectionHeaderView, bundle: nil)
//        workoutCV.register(sectionHeaderViewNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionHeaderView)

		cell.collectionView.tag = indexPath.row
		cell.headerTitle.text = "Header \(indexPath.row)"
	}
}




// MARK: CollectionView Datasource
extension TableCellForCollectionView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// here we use the tag to access the correct index of our data
		// e.g tag = 0, 1, 2, ...or the relavant index in the array
		return images[collectionView.tag].count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: workoutCell, for: indexPath) as! WorkoutCell
        let workout = workouts[indexPath]
		let image = images[collectionView.tag][indexPath.row]
        
        cell.configureCell(workout: <#T##Workout#>)
		return cell
	}
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: sectionHeaderView, for: indexPath) as! SectionHeaderView
//        view.configureSectionHeaderView(indexSection: indexPath.section)
//        return view
//    }
}


// Mark: CollectionViuew Layout
extension TableCellForCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSpacing: CGFloat = 5.0
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: cellSpacing, left: 0, bottom: 20, right: 0)
//        layout.headerReferenceSize =  CGSize(width: collectionView.frame.width, height: 40.0)
//        layout.footerReferenceSize = CGSize(width: collectionView.frame.width, height: 40.0)
        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
