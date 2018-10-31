//
//  MyExercises.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation

enum ExerciseList {
    
    enum Group: String {
        case Chest, Back, Legs, Shoulder, Arms, Core, Cardio

        static var allCases: [Group] {
            return [.Chest, .Back, .Legs, .Shoulder, .Arms, .Core, .Cardio]
        }
        
        func getPictureName() -> String {
            switch self {
            case .Chest: return "bodyChest"
            case .Back: return "bodyBack"
            case .Legs: return "bodyLegs"
            case .Shoulder: return "bodyShoulder"
            case .Arms: return "bodyArms"
            case .Core: return "bodyCore"
            case .Cardio: return "bodyFull"
            }
        }
    }
    
    enum Core: String {
        case absRoutine1 = "Abs Routine 1"
        case absRoutine2 = "Abs Routine 2"
        case absRoutine3 = "Abs Routine 3"
        case absHangingBicycleLegLift = "Hanging Bicycle Leg Lift"
        case absHangingKneeRaises = "Hanging Knee Raises"
        case absHangingSideLegLifts = "Hanging Side Leg Lift"
        case absHangingLegLift = "Hanging Leg Lift"
        case absLyingLegLifts = "Lying Leg Lift"
        case absCrunches = "Crunches"
        case absCrunchesWithLegUp = "Crunches With Leg Up"
        case absPlank = "Plank"
        case absMountainClimber = "Mountain Climber"
        case absScissors = "Scissors"
        
        var group: String { return "Core" }

        static var allCases: [Core] {
            return [.absRoutine1, .absRoutine2, .absRoutine3, .absHangingBicycleLegLift, .absHangingKneeRaises, .absHangingSideLegLifts, .absHangingSideLegLifts, .absLyingLegLifts, .absCrunches, .absCrunchesWithLegUp, .absPlank, .absMountainClimber, .absScissors]
        }
        
    }
    
    enum Chest: String {
        //Weights
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
        
        var group: String { return "Chest" }
        
        static var allCases: [Chest] {
            return [.BarbellBenchPress, .BarbellInclineBenchPress, .BarbellDeclineBenchPress, .DumbellBenchPress, .DumbellInclineBenchPress, .DumbellDeclineBenchPress, .DumbellPOullover, .MachineBenchPress, .MachineInclineBenchPress, .MachineDeclineBenchPress, .SmithMachineBenchPress, .SmithMachineInclineBenchPress, .SmithMachineDeclineBenchPress, .MachineFlys, .CableFlys, .CableInclineFlys, .CableDeclineFlys, .DumbellFlys, .DumbellInclineFlys, .DumbellFloorPress, .Pushups, .ClosePushups, .WidePushups, .WideGripDips]
        }
        
    }

    enum Arms: String {
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
        
        var group: String { return "Arms" }
        
        static var allCases: [Arms] {
            return [.BarbellCurls, .EZBarCurls, .EZBarPreacherCurls, .ReverseEZBarCurls, .ReverseDumbellCurls, .DumbellCurls, .DumbellHammerCurls, .TwistingCurls, .CableCurls, .CloseGripDips, .DiamondPushups]
        }
    }
    
}

