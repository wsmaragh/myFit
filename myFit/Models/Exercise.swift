//
//  Exercise.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit


class Exercise {
    var name: String
    var description: String
    var instructions: String
    var image: UIImage?
    //    var video: String?
    
    init(name: String, description: String, instructions: String, image: UIImage){
        self.name = name
        self.description = description
        self.instructions = instructions
        self.image = image
    }
    
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

