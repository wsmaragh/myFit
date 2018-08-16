//
//  FoodCell.swift
//  Fit
//
//  Created by C4Q on 5/31/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {

	@IBOutlet weak var foodImage: UIImageView!
	@IBOutlet weak var foodLabel: UILabel!

	func configureCell(image: UIImage, foodName: String, quantity: Int, calories: Int){
		foodImage.image = image
		let totalCalories = quantity * calories
		foodLabel.text = "\(foodName) (\(quantity)): \(totalCalories)"
	}

}
