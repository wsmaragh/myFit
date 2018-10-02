//
//  Exercise.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class Exercise: Codable {
    
    var name: String = "Exercise"
    var desc: String = "No Description"
    var instructions: String = "No Instructions"
    var imageStr: String? = ""
    var videoStr: String? = ""
    var group: String? = "Arms"
//    var group: ExerciseList.Group = ExerciseList.Group.Arms
    
    init(name: String, desc: String, instructions: String, imageStr: String?, videoStr: String?, group: String?) {
        self.name = name
        self.desc = desc
        self.instructions = instructions
        self.imageStr = imageStr
        self.videoStr = videoStr
        self.group = group
    }
    
//    convenience init(name: String, desc: String = "", instructions: String = "", imageStr: String? = "", videoStr: String? = "", group: ExerciseList.Group){
//        self.name = name
//        self.desc = desc
//        self.instructions = instructions
//        self.imageStr = imageStr ?? ""
//        self.videoStr = videoStr
//        self.group = group
//    }

//    class func fetchExercise(exerciseID: String, completion: @escaping (Exercise) -> Void) {
//        let urlString = "https://\(exerciseID)" //TODO - create endpoint
//        guard let url = URL(string: urlString) else {return}
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        let task = session.dataTask(with: url) { (data, httpResponse, err) in
//            if let error = err {print(error)}
//            guard let data = data else {print("error getting data");return}
//            do {
//                let exercise = try JSONDecoder().decode(Exercise.self, from: data)
//                completion(exercise)
//            } catch let jsonErr {
//                print("error decoding JSON: ", jsonErr)
//            }
//        }
//        task.resume()
//    }
    
//    class func fetchWorkoutExercises(workoutID: String, completion: @escaping ([Exercise]) -> Void) {
//        let urlString = "https://\(workoutID)" //TODO - create endpoint
//        guard let url = URL(string: urlString) else {return}
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        let task = session.dataTask(with: url) { (data, httpResponse, err) in
//            if let error = err {print(error)}
//            guard let data = data else {print("error getting data");return}
//            do {
//                let exercises = try JSONDecoder().decode([Exercise].self, from: data)
//                completion(exercises)
//            } catch let jsonErr {
//                print("error decoding JSON: ", jsonErr)
//            }
//        }
//        task.resume()
//    }
    
}

