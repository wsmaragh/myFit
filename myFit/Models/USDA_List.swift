//
//  USDA_List.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


//USDA List
struct ListResponse: Codable {
    var list: List
}

struct List: Codable {
    var lt: String // "f",
    var start: Int //0,
    var end: Int //10,
    var total: Int //10,
    var sr: String //"1",
    var sort: String //"n",
    var item: [Item]
}

struct Item: Codable {
    var offset: Int //0,
    var id: String //"45291778",
    var name: String //" ALL NATURAL ICE CREAM, UPC: 07203651151"
}

enum ListType: String {
    case food = "f"
    case foodGroup = "g"
    case derivationCodes = "d"
    case nutrients = "n"
    case specialityNutrients = "ns"
    case standardReleaseNutrients = "nr"
}
