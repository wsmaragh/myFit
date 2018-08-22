//
//  Exercise.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit
import RealmSwift


@objcMembers class Exercise: Object {
    
    dynamic var name: String = ""
    dynamic var desc: String = ""
    dynamic var instructions: String = ""
    dynamic var imageStr: String? = ""
    //    var video: String?
    
    convenience init(name: String, desc: String, instructions: String, imageStr: String?){
        self.init()
        self.name = name
        self.desc = desc
        self.instructions = instructions
        self.imageStr = imageStr ?? ""
    }
    
//    class MyModel: Object {
//        dynamic var myValue = ""
//
//        convenience init(myValue: String) {
//            self.init() //Please note this says 'self' and not 'super'
//            self.myValue = myValue
//        }
//    }
    
//    static func fetchExercise(exerciseID: String, completion: @escaping (Exercise) -> Void) {
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
    
//    static func fetchWorkoutExercises(workoutID: String, completion: @escaping ([Exercise]) -> Void) {
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


enum ChestExercises: String {
    //weights
    case BarbellBenchPress = "Barbell Bench Press"
    case BarbellInclineBenchPress = "Barbell Incline Bench Press"
    case BarbellDeclineBenchPress = "Barbell Decline Bench Press"
    case DumbellBenchPress = "Dumbell Bench Press"
    case DumbellInclineBenchPress = "Dumbell Incline Bench Press"
    case DumbellDeclineBenchPress = "Dumbell Decline Bench Press"
    case DumbellPOullover = "Dumbell Pullovers"
    case MachineBenchPress = "Machine Bench Press"
    case MachineInclineBenchPress = "Machine Incline Press"
    case MachineDeclineBenchPress = "Machine Decline Press"
    case SmithMachineBenchPress = "Smith Machine Bench Press"
    case SmithMachineInclineBenchPress = "Smith Machine Incline Press"
    case SmithMachineDeclineBenchPress = "Smith Machine Decline Press"
    case MachineFlys = "Machine Flys"
    case CableFlys = "Cable Flys"
    case CableInclineFlys = "Cable Incline Flys"
    case CableDeclineFlys = "Cable Decline Flys"
    case DumbellFlys = "Dumbell Flys"
    case DumbellInclineFlys = "Dumbell Incline Flys"
    case DumbellFloorPress = "Dumbell Floor Press"

    //calisthenics
    case Pushups = "Push-ups"
    case ClosePushups = "Close-grip Push-ups"
    case WidePushups = "Wide Push-ups"
    case WideGripDips = "Wide-Grip Dips"
}


enum ArmsExercises: String {
    //weights
    case BarbellCurls = "Barbell Curls"
    case EZBarCurls = "EZ Bar Curls"
    case EZBarPreacherCurls = "EZ Bar Preacher Curls"
    case ReverseEZBarCurls = "Reverse EZ Bar Curls"
    case ReverseDumbellCurls = "Reverse Dumbell Curls"

    case DumbellCurls = "Dumbell Curls"
    case DumbellHammerCurls = "Hammer Curls"
    case TwistingCurls = "Twisting Curls"
    case CableCurls = "Cable Curls"
    
    //calisthenics
    case CloseGripDips = "Close-Grip Dips"
    case DiamondPushups = "Diamond Push-ups"

}

