//
//  USDA_Report.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


//  USDA - Food Report V1
//  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORT.md
struct FoodReportResponseV1: Codable {
    var report: Report
}

struct Report: Codable {
    var sr: String //"1", ---- Release version of the data being reported
    var type: String //"Full" ---- Report type  (basic, full, stats)
    var food: FoodV1 //
}

struct FoodV1: Codable {
    var ndbno: String // "01009",
    var name: String // "Cheese, cheddar (Includes foods for USDA's Food Distribution Program)",
    var sd: String // "CHEESE,CHEDDAR" ---- short description
    var fg: String // "Dairy and Egg Products"  ---- food group
    var manu: String // "" ---- manufacturer
    var ds: String // "Standard Reference" ---- database source: 'Branded Food Products' or 'Standard Reference'
    var ru: String // "g" ---- reporting unit: nutrient values are reported in this unit, usually gram (g) or milliliter (ml)
    var nutrients: [Nutrient]
}

struct Nutrient: Codable {
    var nutrient_id: Int //255,
    var name: String // "Water",
    var group: String // "Proximates" or "Lipids" or "Carbohydrates"
    var unit: String // "g",
    var value: Double // 36.75,
    var dp: Int //108, ---- # of data points
    var measures: [Measure]
}

struct Measure: Codable {
    var label: String // "cup, diced" ---- name of the measure, e.g. "large"
    var eqv: Int // 132, ---- equivalent of the measure expressed as an eunit
    var eunit: String // "g", ---- Unit of equivalent amount, either gram (g) or milliliter (ml)
    var value: Double // 48.51 ---- gram equivalent value of the measure
}

enum ReportType: String {
    case basic = "b"
    case full = "f"
    case stats = "s"
}




//  USDA - Food Report V2
//  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORTV2.md

struct FoodReportResponseV2: Codable {
    var foods: [FoodResults]
    var count: Int // 3,
    var notfound: Int //1,
    var api: Int //2
}

struct FoodResults: Codable {
    var food: FoodV2
}

struct FoodV2: Codable {
    var sr: String //"1",
    var type: String // "f"
    var desc: Desc
    var nutrients: [Nutrient]
}

struct Desc: Codable {
    var ndbno: String // "01009",
    var name: String // "Cheese, cheddar (Includes foods for USDA's Food Distribution Program)",
    var sd: String // "CHEESE,CHEDDAR",
    var fg: String // "Dairy and Egg Products",
    var ds: String // "Standard Reference"
    var ru: String // "g"
}



