/*
 
 This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
 4.0 International License, by Winston Maragh.
 
 */
//
//  USDA_List.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


//  USDA List - request a list of foods, nutrients or food groups.
//  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-LIST.md

struct ListResponse: Codable {
    var list: FoodList
}

struct FoodList: Codable {
    var item: [FoodItem]
    var listType: String
    var sortType: String
    var start: Int
    var end: Int
    var total: Int
    var releaseVersion: String
    
    private enum CodingKeys: String, CodingKey {
        case listType = "lt"
        case sortType = "sort"
        case releaseVersion = "sr"
        case start, end, total, item
    }
}

struct FoodItem: Codable {
    var id: String
    var name: String
}

enum ListType: String {
    case food = "f"
    case foodGroup = "g"
    case derivationCodes = "d"
    case nutrients = "n"
    case specialityNutrients = "ns"
    case standardReleaseNutrients = "nr"
}
