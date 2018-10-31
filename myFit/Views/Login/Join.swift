//
//  Join.swift
//  myFit
//
//  Created by Winston Maragh on 9/13/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit



class JoinHabits: UIView {
    @IBOutlet weak var sleepSlider: UISlider!
    @IBOutlet weak var sleepLabel: UILabel!
    
    @IBOutlet weak var drinkPicker: UIPickerView!
    @IBOutlet weak var smokingPicker: UIPickerView!
    
    let nibName = "JoinHabits"

    
    var sleepHours: Int = 8
    var drinking: HabitOptions = .Never
    var smoking: HabitOptions = .Never
    
//        {
//        didSet {
//            self.sleepLabel.text = "\(sleepSlider.value) hours/day"
//        }
//    }

}


class JoinFinal: UIView {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    
    
    let nibName = "JoinFinal"

}





