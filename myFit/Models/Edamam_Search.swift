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
