//
//  EdamamAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import Alamofire


// Full Nutritional Analysis (POST) - documentation: https://developer.edamam.com/edamam-docs-nutrition-api

class NutritionAPIService {
    private init(){}
    static let shared = NutritionAPIService()
    
    let baseURL = "https://api.edamam.com/api/nutrition-details"


    // MARK: Nutrients (POST request)
    
    
//    // MARK: Food by UPC/Barcode
//    func fetchFoodByUPC(with upc: String, completion: @escaping (Food) -> Void) {
//        
//        guard let upcURLEncodedString = upc.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
//        
//        let urlString = "https://api.edamam.com/api/food-database/parser?app_id=\(APIKeys.Edamam_FoodAppID)&app_key=\(APIKeys.Edamam_FoodAppKey)&upc=\(upcURLEncodedString)"
//        
//        guard let url = URL(string: urlString) else {return}
//        
//        Alamofire.request(url).responseJSON { (response) in
//            if response.result.isSuccess {
//                if let data = response.data {
//                    do {
//                        let JSON = try JSONDecoder().decode(FoodSearchJSON.self, from: data)
//                        let food = JSON.parsed[0].food
//                        completion(food)
//                    }
//                    catch {
//                        print("Error decoding JSON to object.")
//                    }
//                }
//            }
//            else {
//                print("Error\(String(describing: response.result.error))")
//            }
//        }
//    }


}
