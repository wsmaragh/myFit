//
//  BusinessAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import Alamofire


enum YelpCategory: String {
    case gyms = "gyms"
    case parks = "parks"
    static let allCases: [YelpCategory] = [.gyms, .parks]
}


class BusinessAPIService {
    
    private init(){}
    static let shared = BusinessAPIService()
    
    func getBusiness(category: YelpCategory, completion: @escaping ([YelpBusiness]) -> Void) {
        
        let url = "https://api.yelp.com/v3/businesses/search?latitude=\(UserPreferenceService.shared.getLatitude())&longitude=\(UserPreferenceService.shared.getLongitude())&limit=50&radius=16000&categories=\(category.rawValue)"
        
        let headers = ["Authorization" : "Bearer \(APIKeys.yelp_apiKey)",
            "Content-Type": "application/json"]
        
        Alamofire.request(url, method: HTTPMethod.get, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(BusinessJSON.self, from: data)
                        let businesses = JSON.businesses
                        completion(businesses)
                    }
                    catch {print("Error processing data. Error: \(error)")}
                }
            } else {
                print("Error\(String(describing: response.result.error))")
            }
        }
    }
    
}
