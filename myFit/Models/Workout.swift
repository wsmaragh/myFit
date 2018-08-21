//
//  Workout.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import RealmSwift


@objcMembers class Workout: Object, Codable {
    
    dynamic var name: String = ""
    var exercises: [Exercise] = []
//    var duration: Int
    var imageStr: String?
    var numOfExercises: Int { return exercises.count}
    
    convenience init(name: String, exercises: [Exercise], imageStr: String?) {
        self.init()
        self.name = name
        self.exercises = exercises
//        self.duration = duration
        self.imageStr = imageStr
    }
    
    
    
//    func durationString() -> String {
//        return String(duration)
//    }
    
    func addExercise(addExercise exercise: Exercise){
        self.exercises.append(exercise)
        //update duration
//        self.duration += exercise
    }
    
    func deleteExercise(deleteExercise exercise: Exercise){
        //check if exercises contains exercise
        //get the index of the exercise and delete
        //update duration
    }
    
//    static func fetchWorkout(workoutID: String, completion: @escaping ([Workout]) -> Void) {
//        let urlString = "https://\(workoutID)" //TODO - create endpoint
//        guard let url = URL(string: urlString) else {return}
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        let task = session.dataTask(with: url) { (data, httpResponse, err) in
//            if let error = err {print(error)}
//            guard let data = data else {print("error getting data");return}
//            do {
//                let workout = try JSONDecoder().decode([Workout].self, from: data)
//                completion(workout)
//            } catch let jsonErr {
//                print("error decoding JSON: ", jsonErr)
//            }
//        }
//        task.resume()
//    }
    
}

