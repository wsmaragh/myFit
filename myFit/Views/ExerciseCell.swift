//
//  ExerciseCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/5/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    
    static let id = "ExerciseCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        exerciseImageView.layer.cornerRadius = exerciseImageView.layer.bounds.width / 2
        exerciseImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(exercise: Exercise) {
        nameLabel.text = exercise.name
        groupLabel.text = exercise.group
        exerciseImageView.image = #imageLiteral(resourceName: "bgOnBars")
    }

}
