//
//  Edamam_Search.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct EdamamSearchResponse: Codable {
    var text: String // "red apple",
    var parsed: [EdamamFoodResult]  //  [],
}

struct EdamamFoodResult: Codable {
    var food: EdamamFood
}

struct EdamamFood: Codable {
    var id: String // "food_bnbh4ycaqj9as0a9z7h9xb2wmgat",
    var uri: String // "http://www.edamam.com/ontologies/edamam.owl#Food_09003",
    var label: String // "Apples, raw, with skin",
    var nutrients: EdamamNutrient
    var source: String // "Generic"
}

struct EdamamNutrient: Codable {
    var ENERC_KCAL: Double? // 52,
    var PROCNT: Double? // 0.26,
    var FAT: Double? // 0.17,
    var CHOCDF: Double? // 13.81
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
    //The format is calories=RANGE where RANGE is replaced by the value in kcal. RANGE is in one of MIN+, MIN-MAX or MAX, where MIN and MAX are non-negative integer numbers. The + symbol needs to be properly encoded. Examples: “calories=100-300” will return all foods with which have between 100 and 300 kcal per serving.
    case lowCalorieCount = "001-300" //range
    case midCalorieCount = "301-600" //range
    case highCalorieCount = "601-1200" //range

}
