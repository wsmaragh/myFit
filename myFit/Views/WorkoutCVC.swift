//
//  WorkoutCVC.swift
//  Fit
//
//  Created by C4Q on 6/4/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class WorkoutCVC: UICollectionViewCell {

	@IBOutlet weak var workoutImage: UIImageView!
	@IBOutlet weak var workoutLabel: UILabel!

	func configureCell(image: UIImage, labelText: String) {
		workoutImage.image = image
		workoutLabel.text = labelText
	}

}
