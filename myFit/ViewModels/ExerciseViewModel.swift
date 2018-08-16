//
//  ExerciseViewModel.swift
//  myFit
//
//  Created by Winston Maragh on 8/16/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class ExerciseViewModel: NSObject {
    
    weak var exerciseVC: ExerciseVC?
    
    init(controller: ExerciseVC) {
        self.exerciseVC = controller
    }
    
}
