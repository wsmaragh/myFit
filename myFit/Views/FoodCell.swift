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

    static let id = "FoodCell"

    func configureCell(food: SampleFood){
        foodImage.image = food.image
        foodLabel.text = food.name
	}

}
