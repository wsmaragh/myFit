//
//  WorkoutCVC.swift
//  Fit
//
//  Created by C4Q on 6/4/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class WorkoutCell: UICollectionViewCell {

	@IBOutlet weak var workoutImageView: UIImageView!
	@IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    static var cellID: String {
        return String(describing: self)
    }

    func configureCell(workout: Routine) {
        workoutLabel.text = workout.name
        guard let imageStr = workout.imageStr else {return}
        spinner.startAnimating()
        spinner.isHidden = false
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: imageStr) else {return}
            guard let data = try? Data(contentsOf: url) else {return}
            guard let image = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                self?.workoutImageView.image = nil
                self?.workoutImageView.image = image
                self?.spinner.stopAnimating()
                self?.spinner.isHidden = true
            }
        }
        
	}

}
