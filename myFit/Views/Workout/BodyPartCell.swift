//
//  BodyPartCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/5/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class BodyPartCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static var cellID: String {
        return String(describing: self)
    }
    
    func configureCell(bodyPart: ExerciseList.Group){
        nameLabel.text = bodyPart.rawValue
        if let image = UIImage(named: bodyPart.getPictureName()) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "Full")
        }
    }
    
}
