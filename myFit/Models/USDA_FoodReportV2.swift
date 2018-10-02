//
//  USDA_FoodReportV2.swift
//  myFit
//
//  Created by Winston Maragh on 10/2/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


//  USDA - Food Report V2 - documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORTV2.md

struct FoodReportResponseV2: Codable {
    var foods: [FoodResults]
    var count: Int
    var notfound: Int
    var api: Int
}

struct FoodResults: Codable {
    var food: FoodV2
}

struct FoodV2: Codable {
    var reportType: String // "f"
    var desc: Desc
    var nutrients: [Nutrient]
    var releaseVersion: String
    
    private enum CodingKeys: String, CodingKey {
        case reportType = "type"
        case desc
        case nutrients
        case releaseVersion = "sr"
    }
}

struct Desc: Codable {
    var ndbno: String
    var name: String
    var shortDescription: String?
    var foodGroup: String?
    var databaseSource: String?
    var reportingUnit: String? // "g"
    
    private enum CodingKeys: String, CodingKey {
        case ndbno, name
        case shortDescription = "sd"
        case foodGroup = "fg"
        case databaseSource = "ds"
        case reportingUnit = "ru"
    }
}



