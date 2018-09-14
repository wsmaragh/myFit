//
//  FoodAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import Alamofire



class FoodAPIService {
    
    private init(){}
    static let shared = FoodAPIService()
    
    
    // MARK: Food by Ingredient -- has pagination - using _links
    func fetchFoodByIngredient(with ingredient: String, completion: @escaping (Food) -> Void) {
        
        guard let ingredientURLEncodedString: String = ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        let urlString = "https://api.edamam.com/api/food-database/parser?app_id=\(APIKeys.Edamam_FoodAppID)&app_key=\(APIKeys.Edamam_FoodAppKey)&ingr=\(ingredientURLEncodedString)"
        
        guard let url = URL(string: urlString) else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(FoodSearchJSON.self, from: data)
                        let food = JSON.parsed[0].food
                        completion(food)
                    }
                    catch {
                        print("Error decoding JSON to object.")
                    }
                }
            }
            else {
                print("Error\(String(describing: response.result.error))")
            }
        }
    }
    
    
    // MARK: Food by UPC/Barcode
    func fetchFoodByUPC(with upc: String, completion: @escaping (Food) -> Void) {
        
        guard let upcURLEncodedString = upc.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        let urlString = "https://api.edamam.com/api/food-database/parser?app_id=\(APIKeys.Edamam_FoodAppID)&app_key=\(APIKeys.Edamam_FoodAppKey)&upc=\(upcURLEncodedString)"
        
        guard let url = URL(string: urlString) else {return}
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(FoodSearchJSON.self, from: data)
                        let food = JSON.parsed[0].food
                        completion(food)
                    }
                    catch {
                        print("Error decoding JSON to object.")
                    }
                }
            }
            else {
                print("Error\(String(describing: response.result.error))")
            }
        }
    }
    
    //  MARK: Food Text Analysis (GET)
//    func fetchFoodTextAnalysis(with ingredient: String, completion: @escaping (Recipe) -> Void) {
//        guard let ingredientURLEncodedString = ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
//        let urlString = "https://api.edamam.com/api/nutrition-data?app_id=867487d3&app_key=e9fe2c98395785f2de8f0e6d4a7a8fb5&ingr=\(ingredientURLEncodedString)"
//        guard let url = URL(string: urlString) else {return}
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        let task = session.dataTask(with: url) { (data, httpResponse, err) in
//            if let error = err {print(error)}
//            // if let httpResponse = httpResponse {print(httpResponse)}
//            guard let data = data else {print("error getting data");return}
//            do {
//                let recipe = try JSONDecoder().decode(Recipe.self, from: data)
//                completion(recipe)
//            } catch let jsonErr {
//                print("error decoding JSON: ", jsonErr)
//            }
//        }
//        task.resume()
//    }
    
    
}
