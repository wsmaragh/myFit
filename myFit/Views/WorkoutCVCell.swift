//
//  WorkoutCVCell.swift
//  Fit
//
//  Created by C4Q on 6/8/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class WorkoutCVCell: UICollectionViewCell {

	@IBOutlet weak var imageView: UIImageView!
	

	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.contentMode = .scaleAspectFit
	}

}
