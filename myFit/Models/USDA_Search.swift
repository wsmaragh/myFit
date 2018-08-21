//
//  USDA_Search.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


//  USDA - Search
//  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-SEARCH.md

struct USDASearchResponse: Codable {
    var list: SearchList
}

struct SearchList: Codable {
    var q: String // "butter"
    var sr: String // "1"
    var ds: String // "any"
    var start: Int //0
    var end: Int //25
    var total: Int //4671
    var group: String //""
    var sort: String //"n"
    var item: [SearchItem]
}

struct SearchItem: Codable {
    var offset: Int// 0
    var group: String // "Branded Food Products Database",
    var name: String // "ABBOTT, EAS, MYOPLEX 30 BUILD MUSCLE BAR, CHOCOLATE PEANUT BUTTER, UPC: 791083622813"
    var ndbno: String // "45258948"
    var ds: String // "LI"
    var manu: String // "Ross Products Division"
}

enum SearchSort: String {
    case byFoodName = "n"
    case bySearchRelevance = "r"
}

