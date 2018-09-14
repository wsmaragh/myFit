//
//  YelpEventAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import Alamofire


class YelpEventAPIService {
    
    private init(){}
    static let shared = YelpEventAPIService()
    
    func getActiveEvents(completion: @escaping ([YelpEvent]) -> Void) {
        
        let url = "https://api.yelp.com/v3/events?latitude=\(UserPreferenceService.shared.getLatitude())&longitude=\(UserPreferenceService.shared.getLongitude())&radius=16000&limit=50&categories=sports-active-life"
        
        let headers = ["Authorization" : "Bearer \(APIKeys.yelp_apiKey)",
            "Content-Type": "application/json"]
        
        Alamofire.request(url, method: HTTPMethod.get, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(YelpEventJSON.self, from: data)
                        let events = JSON.events
                        completion(events)
                    }
                    catch {print("Error processing data. Error: \(error)")}
                }
            } else {
                print("Error\(String(describing: response.result.error))")
            }
        }
    }
    
}
