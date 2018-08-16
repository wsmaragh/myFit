//
//  Workout.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


class Workout {
    var name: String
    var exercises: [Exercise] = []
    var duration: Int = 0 //minutes
    var numOfExercises: Int {
        return exercises.count
    }
    
    init(name: String){
        self.name = name
    }
    
    func addExercise(addExercise exercise: Exercise){
        self.exercises.append(exercise)
        //update duration
    }
    
    func deleteExercise(deleteExercise exercise: Exercise){
        //check if exercises contains exercise
        //get the index of the exercise and delete
        //update duration
    }
}
