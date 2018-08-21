//
//  EdamamAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct EdamamInfo {
    //  documentation: https://developer.edamam.com/food-database-api-docs

    
    // MARK: Search by Ingredient -- has pagination - using _links
    
    static func fetchIngredientSearch(with ingredient: String, completion: @escaping (EdamamFood) -> Void) {
        let urlString = "https://api.edamam.com/api/food-database/parser?app_id=\(APIKeys.Edamam_FoodAppID)&app_key=\(APIKeys.Edamam_FoodAppKey)&ingr=\(ingredient)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let ingredientSearchResponse = try JSONDecoder().decode(EdamamSearchResponse.self, from: data)
                let ingredientSearchResult = ingredientSearchResponse.parsed[0].food
                completion(ingredientSearchResult)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    // MARK: Search by UPC/Barcode
    
    static func fetchUPCSearch(with upc: String, completion: @escaping (EdamamFood) -> Void) {
        let urlString = "https://api.edamam.com/api/food-database/parser?app_id=\(APIKeys.Edamam_FoodAppID)&app_key=\(APIKeys.Edamam_FoodAppKey)&upc=\(upc)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let upcSearchResponse = try JSONDecoder().decode(EdamamSearchResponse.self, from: data)
                let upcSearchResult = upcSearchResponse.parsed[0].food
                completion(upcSearchResult)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    
    //Recipe Search - https://developer.edamam.com/edamam-docs-recipe-api
    
    
    
    
    //Nutritional Analysis - https://developer.edamam.com/edamam-docs-nutrition-api
    
    
    
    // Nutrients (POST request)
    
}
