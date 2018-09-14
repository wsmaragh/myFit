//
//  EBEventSearchAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 9/7/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import Alamofire


// EventBrite
class EBEventAPIService {
    
    private init(){}
    static let shared = EBEventAPIService()
    
    func getFitnessEvents(from searchCriteria: String, completion: @escaping ([EBEvent]) -> Void) {
        
        let url = "https://www.eventbriteapi.com/v3/events/search/?\(APIKeys.EventBrite_token)&location.latitude=\(UserPreferenceService.shared.getLatitude())&location.longitude=\(UserPreferenceService.shared.getLongitude())&location.within=5mi&categories=107,108&start_date.keyword=this_month&sort_by=date"
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(EventSearchJSON.self, from: data)
                        let events = JSON.events
                        completion(events)
                    }
                    catch {print("Error processing data \(error)")}
                }
            }
            else {
                print("Error\(String(describing: response.result.error))")
            }
        }
    }
}
