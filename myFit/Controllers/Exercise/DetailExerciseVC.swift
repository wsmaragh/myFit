//
//  ExerciseVC.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit

class DetailExerciseVC: UIViewController {

    @IBOutlet weak var instructionsTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var pictureIV: UIImageView!
    @IBOutlet weak var videoIV: UIImageView!
    
    var viewModel: DetailExerciseViewModel!

    var exercise: Exercise! {
        didSet {
            setupUI()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setupUI(){
        //fetch image
        //fetch video
        //get instructions
        //get description
        self.navigationItem.title = exercise.name
    }

}
