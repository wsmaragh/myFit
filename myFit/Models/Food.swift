//
//  Edamam_Search.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct FoodSearchJSON: Codable {
    var text: String
    var parsed: [FoodResult]
}

struct FoodResult: Codable {
    var food: Food
}

struct Food: Codable {
    var id: String
    var uri: String
    var label: String
    var nutrients: EdamamNutrient
    var source: String
}

struct EdamamNutrient: Codable {
    var calories: Double?
    var protein: Double?
    var fat: Double?
    var carbohydrates: Double?
    
    private enum CodingKeys: String, CodingKey {
        case calories = "ENERC_KCAL"
        case protein = "PROCNT"
        case fat = "FAT"
        case carbohydrates = "CHOCDF"
    }
}


enum NutritionalCodes: String {
    case ENERC_KCAL = "Calories" //kcal
    case FAT = "Fat" // g
    case FASAT = "Saturated Fat"    // g
    case FAMS = "Monounsaturated Fat" // g
    case FAPU = "Polyunsaturated Fat" //g
    case FATRN = "Trans Fat"   // g
    case CHOLE = "Cholesterol" // mg
    case CHOCDF = "Carbs"  // g
    case SUGAR = "Sugars"   //  g
    case PROCNT = "Protein" // g
    case CA = "Calcium" // mg
    case VITA_RAE = "Vitamin A" // æg
    case THIA = "Thiamin (B1)" // mg
    case RIBF = "Riboflavin (B2)" //mg
    case NIA = "Niacin (B3)" // mg
    case VITB6A = "Vitamin B6" // mg
    case VITB12 = "Vitamin B12"  // æg
    case VITC = "Vitamin C" // mg
    case VITD = "Vitamin D" // æg
    case TOCPHA = "Vitamin E" // mg
    case VITK1 = "Vitamin K" // æg
    case FIBTG = "Fiber"    // g
    case FOLDFE = "Folate" // æg
    case NA = "Sodium" // mg
    case K = "Potassium"  // mg
    case MG = "Magnesium" // mg
    case P = "Phosphorus" // mg
    case FE = "Iron" // mg
}


enum CalorieCriteria: String {
    case lowCalorieCount = "001-300"
    case midCalorieCount = "301-600"
    case highCalorieCount = "601-1200"
    //The format is calories=RANGE where RANGE is replaced by the value in kcal. RANGE is in one of MIN+, MIN-MAX or MAX, where MIN and MAX are non-negative integer numbers. The + symbol needs to be properly encoded. Examples: “calories=100-300” will return all foods with which have between 100 and 300 kcal per serving.
}
