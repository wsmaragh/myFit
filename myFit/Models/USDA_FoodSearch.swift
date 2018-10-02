/*
 
 This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
 4.0 International License, by Winston Maragh.
 
 */
//
//  USDA_Search.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


//  USDA - Search. Documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-SEARCH.md
struct USDASearchResponse: Codable {
    var list: FoodSearchList
}

struct FoodSearchList: Codable {
    var item: [FoodSearchItem]
    var searchTerm: String
    var sortType: String
    var ds: String
    var start: Int
    var end: Int
    var total: Int
    var group: String
    var releaseVersion: String
    
    private enum CodingKeys: String, CodingKey {
        case searchTerm = "q"
        case sortType = "sort"
        case releaseVersion = "sr"
        case ds, start, end, total, group, item
    }
}

struct FoodSearchItem: Codable {
    var offset: Int
    var foodGroup: String
    var name: String
    var ndbno: String
    var ds: String
    var manu: String
    
    private enum CodingKeys: String, CodingKey {
        case foodGroup = "group"
        case offset, name, ndbno, ds, manu
    }
}

enum SortType: String {
    case byFoodName = "n"
    case bySearchRelevance = "r"
}

