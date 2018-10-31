//
//  FoodSection.swift
//  myFit
//
//  Created by Winston Maragh on 10/2/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation

enum SectionsForFood: String {
    case Breakfast
    case Lunch
    case Dinner
    case Drinks
    case Snacks
}

public struct FoodSection {
    var name: SectionsForFood
    var items: [Food]
    var collapsed: Bool
    
    init(name: SectionsForFood, items: [Food], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}
