//
//  APIKeys.swift
//  Fit
//
//  Created by Winston Maragh on 8/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct USDAFoodInfo {
    public static let ApiKey = "iaXWVbfVGpumsO6USwZH4TyyoKFMbcMoiNhH8Gtd"
    public static let _FoodID = "01009" //Cheddar Cheese
    public static let _FoodSearch = "Corn"
    
    //List - request a list of foods, nutrients or food groups.
    ////documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-LIST.md
    public static let listEndpoint = "https://api.nal.usda.gov/ndb/list?format=json&lt=f&sort=n&api_key=\(ApiKey)"
    
    //Reports #1
    //documentation:    https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORT.md
    public static let report1Endpoint = "https://api.nal.usda.gov/ndb/reports/?ndbno=\(_FoodID)&type=b&format=json&api_key=\(ApiKey)"
    
    //Reports #2
    //documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORTV2.md
    public static let report2Endpoint = "https://api.nal.usda.gov/ndb/V2/reports?ndbno=01009&ndbno=01009&ndbno=45202763&ndbno=35193&type=b&format=json&api_key=\(ApiKey)"
    
    //Search
    //documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-SEARCH.md
    public static let searchEndpoint =  "https://api.nal.usda.gov/ndb/search/?format=json&q=\(_FoodSearch)&sort=n&max=25&offset=0&api_key=\(ApiKey)"
    
}



struct EdamamInfo {
    //website link: https://developer.edamam.com/food-database-api-docs
    
    //TODO: Remove DUMMY -
    public static let IngredientSearch = "red%20apple"
    public static let UPCSearch = "040000394129" //snickers
    
    
    //Food Search - https://developer.edamam.com/food-database-api-docs
    public static let FoodAppID = "b68a8850"
    public static let FoodAppKey = "d83cc567f9a47ac94c4b4ce9073568d2"
    
    //Search either by Ingredient or UPC
    public static let IngredientsSearchEndpoint = "https://api.edamam.com/api/food-database/parser?ingr=\(EdamamInfo.IngredientSearch)&app_id=\(EdamamInfo.FoodAppID)&app_key=\(EdamamInfo.FoodAppKey)&page=0"
    public static let UPCSearchEndpoint = "https://api.edamam.com/api/food-database/parser?upc=\(EdamamInfo.UPCSearch)&app_id=\(EdamamInfo.FoodAppID)&app_key=\(EdamamInfo.FoodAppKey)"
    
    
    //Recipe Search - https://developer.edamam.com/edamam-docs-recipe-api
    
    
    //Nutritional Analysis - https://developer.edamam.com/edamam-docs-nutrition-api
    
}
