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

	let cellSpacing:CGFloat = 10.0

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func configureCollectionView(forCell cell: TableCellForCollectionView, forIndexPath indexPath: IndexPath) {
		cell.collectionView.delegate = self
		cell.collectionView.dataSource = self

		// tag the collectionView here to so you can access the correct data set in UICollectionViewDataSource
		cell.collectionView.tag = indexPath.row

		cell.headerTitle.text = "Header \(indexPath.row)"
	}
}




//Datasource
extension TableCellForCollectionView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// here we use the tag to access the correct index of our data
		// e.g tag = 0, 1, 2, ...or the relavant index in the array
		return images[collectionView.tag].count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCVCell", for: indexPath) as! WorkoutCVCell

		// here we use the tag to access the correct index of our data
		// e.g tag = 0, 1, 2, ...or the relavant index in the array
		let image = images[collectionView.tag][indexPath.row]

		cell.imageView.image = image
		return cell
	}
}


//Flow layout
extension TableCellForCollectionView: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let numCells: CGFloat = 2.0 // cells visible in row
		let numSpaces: CGFloat = numCells + 1
		let screenWidth = UIScreen.main.bounds.width // screen width of device

		// retrun item size
		return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: collectionView.bounds.height - (cellSpacing * 2))
	}

	// padding around our collection view
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: cellSpacing, left: 0, bottom: cellSpacing, right: 0)
	}

	// padding between cells / items
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return cellSpacing
	}
}
