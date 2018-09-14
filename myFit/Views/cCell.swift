//
//  cCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class cCell: UICollectionViewCell {
    
    @IBOutlet weak var bImageView: UIImageView!
    @IBOutlet weak var workoutNameLabel: UILabel!
    @IBOutlet weak var timeDifficultyLabel: UILabel!
    @IBOutlet weak var workoutTypeLabel: UILabel!

    static let id = "cCell"
    
    func configureCell(workout: Routine){
        workoutNameLabel.text = workout.name
        timeDifficultyLabel.text = "\(workout.duration) min - Hard"
        workoutTypeLabel.text = "Gym"  //workout.type
        bImageView.image = UIImage(named: workout.imageStr!)

        //Kingfisher
//        bImageView.kf.indicatorType = .activity
//        bImageView.kf.setImage(with: URL(string:post.postImageStr!), placeholder: #imageLiteral(resourceName: "placeholderCamera"), options: nil, progressBlock: nil, completionHandler: nil)
//        //        postImageView.kf.setImage(with: URL(string:post.postImageStr))
//        
//        if let imageURL = post.userImageStr {
//            self.userImageView.kf.indicatorType = .activity
//            self.userImageView.kf.setImage(with: URL(string:imageURL))
//        }

    }
    
}
