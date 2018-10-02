/*
 
 This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
 4.0 International License, by Winston Maragh.
 
 */
//
//  USDA_Report.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


//  USDA - Food Report V1 - documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORT.md
struct FoodReportResponseV1: Codable {
    var report: FoodReport
}

struct FoodReport: Codable {
    var food: FoodV1
    var reportType: String
    var releaseVersion: String
    
    private enum CodingKeys: String, CodingKey {
        case food
        case reportType = "type"
        case releaseVersion = "sr"
    }
}

struct FoodV1: Codable {
    var ndbno: String // "01009",
    var name: String
    var shortDescription: String?
    var foodGroup: String?
    var databaseSource: String
    var manufacturer: String?
    var reportingUnit: String
    var nutrients: [Nutrient]?
    
    private enum CodingKeys: String, CodingKey {
        case ndbno, name, nutrients
        case shortDescription = "sd"
        case foodGroup = "fg"
        case databaseSource = "ds"
        case manufacturer = "manu"
        case reportingUnit = "ru"
    }
    
}

struct Nutrient: Codable {
    var nutrient_id: String //255,
    var name: String // "Water",
    var group: String // "Proximates" or "Lipids" or "Carbohydrates"
    var unit: String // "g",
    var value: String // 36.75,
    var dp: Int? //108, ---- # of data points
    var measures: [Measure]
}

struct Measure: Codable {
    var label: String // "cup, diced" ---- name of the measure, e.g. "large"
    var eqv: Float? // 132, ---- equivalent of the measure expressed as an eunit
    var eunit: String // "g", ---- Unit of equivalent amount, either gram (g) or milliliter (ml)
    var value: String // 48.51 ---- gram equivalent value of the measure
}

enum ReportType: String {
    case basic = "b"
    case full = "f"
    case stats = "s"
}

enum DatabaseSource: String {
    case standard = "Standard Reference"
    case brandedFoods = "Branded Food Products"
}

enum ReportingUnit: String {
    case grams = "g"
    case milligrams = "mg"
    case milliliter = "ml"
}

