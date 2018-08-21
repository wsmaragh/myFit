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
        guard let ingredientURLEncodedString: String = ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let urlString = "https://api.edamam.com/api/food-database/parser?app_id=\(APIKeys.Edamam_FoodAppID)&app_key=\(APIKeys.Edamam_FoodAppKey)&ingr=\(ingredientURLEncodedString)"
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
        guard let upcURLEncodedString = upc.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let urlString = "https://api.edamam.com/api/food-database/parser?app_id=\(APIKeys.Edamam_FoodAppID)&app_key=\(APIKeys.Edamam_FoodAppKey)&upc=\(upcURLEncodedString)"
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
    
    
    
    //  MARK: Recipe Search
    //  documentation: https://developer.edamam.com/edamam-docs-recipe-api
    
    static func fetchARecipe(with recipeURI: String, dietHealthCriteria: DietHealthCriteria?, calorieRange: String?, from: Int?, to: Int?, completion: @escaping (Recipe) -> Void) {
//        let safeUriSearchString = recipeURI.replacingOccurrences(of: ":", with: "%3").replacingOccurrences(of: "/", with: "%2F").replacingOccurrences(of: "#", with: "%23")
        guard let safeUriSearchString = recipeURI.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let urlString = "https://api.edamam.com/search?app_id=\(APIKeys.Edamam_RecipeAppID)&app_key=\(APIKeys.Edamam_RecipeAppKey)&r=\(safeUriSearchString)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let recipeResponse = try JSONDecoder().decode([Recipe].self, from: data)
                let recipe = recipeResponse[0]
                completion(recipe)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    static func fetchRecipes(with searchTerm: String, dietHealthCriteria: DietHealthCriteria?, calorieRange: String?, from: Int?, to: Int?, completion: @escaping ([Recipe]) -> Void) {
        guard let safeSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        var urlString = "https://api.edamam.com/search?app_id=\(APIKeys.Edamam_RecipeAppID)&app_key=\(APIKeys.Edamam_RecipeAppKey)&q=\(safeSearchTerm)"
        if let dietHealthCriteria = dietHealthCriteria {
            urlString += "&health=\(dietHealthCriteria.rawValue)" //alcohol-free
        }
        if let calorieRange = calorieRange {
            urlString += "&calories=\(calorieRange)" //591-722
        }
        if let from = from, let to = to {
            urlString += "&from=\(from)" //0
            urlString += "&to=\(to)" //3
        }
     
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let recipeResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                let recipes = recipeResponse.hits.map{$0.recipe}
                completion(recipes)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    //  MARK: Food Text Analysis (GET)

    static func fetchFoodTextAnalysis(with ingredient: String, completion: @escaping (Recipe) -> Void) {
        guard let ingredientURLEncodedString = ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let urlString = "https://api.edamam.com/api/nutrition-data?app_id=867487d3&app_key=e9fe2c98395785f2de8f0e6d4a7a8fb5&ingr=\(ingredientURLEncodedString)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let recipe = try JSONDecoder().decode(Recipe.self, from: data)
                completion(recipe)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    //  MARK: Full Nutritional Analysis (POST)
    //  documentation: https://developer.edamam.com/edamam-docs-nutrition-api
    // let baseURL = "https://api.edamam.com/api/nutrition-details"
    
    
    // MARK: Nutrients (POST request)
    
}
