//
//  Join.swift
//  myFit
//
//  Created by Winston Maragh on 9/13/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class JoinBio: UIView {
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var dobPicker: UIDatePicker!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var nextButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    
    let nibName = "JoinBio"
    var contentView: UIView?
    
    var gender: Gender = .Male
    var dob: String = "1988-12-05"
    var height: Int = 70
    var weight: Int = 190
    
}

class ResuableCustomView: UIView {
    
    let nibName = "ReusableCustomView"
    var contentView: UIView?
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonTap(_ sender: UIButton) {
        label.text = "Hi"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}



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





