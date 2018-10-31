//
//  RoutineExerciseCell.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class RoutineExerciseCell: UITableViewCell {

    @IBOutlet weak var numberOfExercisesLabel: UILabel!
    @IBOutlet weak var exerciseImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    static var cellID: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        exerciseImageView.layer.cornerRadius = exerciseImageView.layer.bounds.width / 2
//        exerciseImageView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(exercise: Exercise, index: Int) {
        numberOfExercisesLabel.text = "\(index+1)"
        nameLabel.text = exercise.name
        groupLabel.text = exercise.group
        exerciseImageView.image = #imageLiteral(resourceName: "bgOnBars")
        durationLabel.text = "35 min"
    }
    
}
