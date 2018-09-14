//
//  bCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class bCell: UICollectionViewCell {
    
    @IBOutlet weak var bImageView: UIImageView!
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var timeDifficultyLabel: UILabel!
    @IBOutlet weak var workoutTypeLabel: UILabel!
    
    static let id = "bCell"

    func configureCell(workout: Routine){
        workoutNameLabel.text = workout.name
        timeDifficultyLabel.text = "\(workout.duration) min - Intermediate"
        workoutTypeLabel.text = "Calisthenics"  //workout.type
        bImageView.image = UIImage(named: workout.imageStr!)
        
        //if let image = UIImage(named:  workout.name) {
        //    bImageView.image = image
        //} else {
        //    bImageView.image = UIImage(named: "onBars")
        //}
    }
    
}
