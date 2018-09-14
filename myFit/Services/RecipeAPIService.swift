//
//  EdamamAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import Alamofire



class RecipeAPIService {
    private init(){}
    static let shared = RecipeAPIService()
    
    
    // MARK: Recipes
    
    func fetchRecipes(with searchTerm: String, dietHealthCriteria: DietHealthCriteria?, completion: @escaping ([Recipe]) -> Void) {
        
        guard let encodedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        var urlString = "https://api.edamam.com/search?app_id=\(APIKeys.Edamam_RecipeAppID)&app_key=\(APIKeys.Edamam_RecipeAppKey)&q=\(encodedSearchTerm)&from=0&to=50"
        
        if let diet = dietHealthCriteria {
            urlString += "&diet=\(diet.rawValue)"
        }
        
        guard let url = URL(string: urlString) else {return}
    
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {

                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(RecipeJSON.self, from: data)
                        let recipes = JSON.hits.map({$0.recipe})
                        completion(recipes)
                    }
                    catch let error {
                        print("Error decoding JSON to object.", error.localizedDescription)
                    }
                }
            }
            else {
                print("Error\(String(describing: response.result.error))")
            }
        }
        

    }
    
    
    
    func fetchARecipe(with recipeURI: String, dietHealthCriteria: DietHealthCriteria?, completion: @escaping (Recipe) -> Void) {
        
        guard let safeRecipeUriSearchString = recipeURI.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        var urlString = "https://api.edamam.com/search?app_id=\(APIKeys.Edamam_RecipeAppID)&app_key=\(APIKeys.Edamam_RecipeAppKey)&r=\(safeRecipeUriSearchString)"
        
        if let diet = dietHealthCriteria {
            urlString += "&diet=\(diet.rawValue)"
        }
        
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
    
    
}
