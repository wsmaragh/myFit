/*
 
 This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
 4.0 International License, by Winston Maragh.
 
 */
//
//  Workout.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct Routine: Codable {
    
    var name: String = "Routine"
    var exercises: [Exercise] = []
    var duration: Int = 0
    var imageStr: String?
    var numOfExercises: Int { return exercises.count}
    
    func durationString() -> String {
        return String(duration)
    }
    
    mutating func addExercise(addExercise exercise: Exercise){
        self.exercises.append(exercise)
//        self.duration += exercise.length
    }
    
    mutating func deleteExercise(deleteExercise exercise: Exercise){
        
        //check if exercises contains exercise
        //get the index of the exercise and delete
        //update duration
    }
    
}

