//
//  Json.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import UIKit


struct DatabaseJSON {
    
    private static var absRoutine1 = Exercise(name: "abs Routine 1", desc: "", instructions: "", imageStr: "absRoutine1", videoStr: "absRoutine1", group: "Core")
    private static var absRoutine2 = Exercise(name: "abs Routine 2", desc: "", instructions: "", imageStr: "absRoutine2", videoStr: "absRoutine2", group: "Core")
    private static var absRoutine3 = Exercise(name: "abs Routine 3", desc: "", instructions: "", imageStr: "absRoutine3", videoStr: "absRoutine3", group: "Core")
    private static var absHangingBicycleLegLift = Exercise(name: "Hanging Bicycle Leg Lift", desc: "", instructions: "", imageStr: "absHangingBicycleLegLift", videoStr: "absHangingBicycleLegLift", group: "Core")
    private static var absHangingKneeRaises = Exercise(name: "Hanging Knee Raises", desc: "", instructions: "", imageStr: "absHangingKneeRaises", videoStr: "absHangingKneeRaises", group: "Core")
    private static var absHanginSideLegLifts = Exercise(name: "Hanging Side Leg Lift", desc: "", instructions: "", imageStr: "absHanginSideLegLifts", videoStr: "absHanginSideLegLifts", group: "Core")
    private static var absHangingLegLift = Exercise(name: "Hanging Leg Lift", desc: "", instructions: "", imageStr: "absHangingLegLift", videoStr: "absHangingLegLift", group: "Core")
    private static var absLyingLegLifts = Exercise(name: "Lying eg Lift", desc: "", instructions: "", imageStr: "absLyingLegLifts", videoStr: "absLyingLegLifts", group: "Core")
    private static var absCrunches = Exercise(name: "Crunches", desc: "", instructions: "", imageStr: "absCrunches", videoStr: "absCrunches", group: "Core")
    private static var absCrunchesWithLegUp = Exercise(name: "Crunches With Legs Up", desc: "", instructions: "", imageStr: "absCrunchesWithLegUp", videoStr: "absCrunchesWithLegUp", group: "Core")
    private static var absPlank = Exercise(name: "Plank", desc: "", instructions: "", imageStr: "absPlank", videoStr: "absPlank", group: "Core")
    private static var absMountainClimber = Exercise(name: "Mountain Climber", desc: "", instructions: "", imageStr: "absMountainClimber", videoStr: "absMountainClimber", group: "Core")
    private static var absScissors = Exercise(name: "Scissors", desc: "", instructions: "", imageStr: "absScissors", videoStr: "absScissors", group: "Core")
    
    static let absExercises: [Exercise] = [absRoutine1, absRoutine2, absRoutine3, absHangingBicycleLegLift, absHangingKneeRaises, absHanginSideLegLifts, absHangingLegLift, absLyingLegLifts, absCrunches, absCrunchesWithLegUp, absPlank, absMountainClimber, absScissors]
    
    
    //chest exercises
    
    
    //back exercises
    
    
    //shoulders exercises

    
    //arms exercises
    
    
    //legs exercises
    
    
    //cardio exercises


    
    // MARK: Routines
    
    //routine 1
    //routine 2
    //routine 3
    //routine 4
    //routine 5
    //routine 6

    
    
}




struct SampleFood {
    var name: String
    var image: UIImage
}


struct DummyData {
    static let sampleMyWorkout: [Routine] = [
        Routine(name: "Core Madness", exercises: [], duration: 30, imageStr: "workout2"),
        Routine(name: "Chest Expander", exercises: [], duration: 45, imageStr: "workout1"),
        Routine(name: "Shoulder Boulder", exercises: [], duration: 75,  imageStr: "workout3"),
        Routine(name: "Massive Legs", exercises: [], duration: 20,  imageStr: "workout4"),
        Routine(name: "Insanity Cardio", exercises: [], duration: 90,  imageStr: "workout5"),
        Routine(name: "Jacked", exercises: [], duration: 30,  imageStr: "workout6")
    ]
    
    static let sampleSuggestedWorkout: [Routine] = [
        Routine(name: "Jacked", exercises: [], duration: 30,  imageStr: "workout6"),
        Routine(name: "Insanity Cardio", exercises: [], duration: 90,  imageStr: "workout5"),
        Routine(name: "Massive Legs", exercises: [], duration: 20,  imageStr: "workout4"),
        Routine(name: "Shoulder Boulder", exercises: [], duration: 75,  imageStr: "workout3"),
        Routine(name: "Chest Expander", exercises: [], duration: 45, imageStr: "workout2"),
        Routine(name: "Core Madness", exercises: [], duration: 30, imageStr: "workout1")
    ]
    
    
    static let sampleFoodBreakfast: [SampleFood] = [
        SampleFood(name: "Eggs", image: #imageLiteral(resourceName: "food_Eggs")),
        SampleFood(name: "Oatmeal", image: #imageLiteral(resourceName: "food_Oatmeal"))
    ]
    
    static let sampleFoodLunch: [SampleFood] = [
        SampleFood(name: "Burger", image: #imageLiteral(resourceName: "food_Burger")),
        SampleFood(name: "Peanuts", image: #imageLiteral(resourceName: "food_snack"))
        ]
    
    static let sampleFoodDinner: [SampleFood] = [
        SampleFood(name: "Pasta", image: #imageLiteral(resourceName: "food_Pasta")),
        SampleFood(name: "Water", image: #imageLiteral(resourceName: "food_water")),
        ]
}

