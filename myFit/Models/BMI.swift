/*
 
 This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
 4.0 International License, by Winston Maragh.
 
 */
//
//  BMI.swift
//  Fit
//
//  Created by C4Q on 6/5/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


class BMI {
    var weight: Double
    var height: Double
    var age: Int
    var gender: Gender

    
    init(weight: Double, height: Double, age: Int, gender: Gender){
        self.weight = weight
        self.height = height
        self.age = age
        self.gender = gender
    }
    
    private func getAgeFromDOB(dob: Date) -> Int {
        return dob.age
    }
    
    private func getBMI(weight: Double, height: Double, age: Int, gender: Gender) -> (bmi: Double, descr: String){
        
        var result: (Double, String) = (0.0, "")
        
        //TODO: calculate BMI
        let bmi: Double = ((weight) / (height * height)) * 703
        var descr: String = "normal"
        
        switch bmi {
        case 0..<18.5: descr = "underweight"
        case 18.5...24.9: descr = "normal"
        case 25...29.9: descr = "overweight"
        case 30...39.9: descr = "obese"
        case 40...60: descr = "morbidly obese"
        default: descr = "normal"
        }
        
        result = (bmi, descr)
        
        return result
    }
    
    
    // 1 pound = 0.45359237 kilograms

    /*****************************
     
     GENDER       AGE      LOW          NORMAL       OVERWEIGHT   OBESE
     Female      20-39    <21.0        21.0-32.9     33.0-38.9    >= 39.0
     40-59       <23.0   23.0-33.9     34.0-39.9     >= 40.0
     60-79       <24.0   24-35.9       36.-41.9      >= 42.0
     
     Male        20-39    <8.0          8.0-19.9     20.0-24.9    >= 25.0
     40-59       <11.0   11.0-21.9      22.0-27.      >=28.0
     60-79       <13.0   13.0-24.9      25.0-29.9     >=30.0
     
     *****************************/
    
    
    //BMI is not used for muscle builders, long distance athletes, pregnant women, the elderly or young children. This is because BMI does not take into account whether the weight is carried as muscle or fat, just the number
    
    //BMI Adjustment: Those with a higher muscle mass, such as athletes, may have a high BMI but not be at greater health risk. Those with a lower muscle mass, such as children who have not completed their growth or the elderly who may be losing some muscle mass may have a lower BMI.
    
}

