//
//  USDAFood.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct USDAFoodAPIService {

    //  MARK: List
    
    static func fetchFoodList(listType: ListType, completion: @escaping ([FoodItem]) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/list?api_key=\(APIKeys.USDA_APIKey)&format=json&lt=\(listType.rawValue)&sort=n"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let listResponse = try JSONDecoder().decode(ListResponse.self, from: data)
                let foodList = listResponse.list.item
                completion(foodList)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    //  MARK: Search
    
    static func fetchFoodSearch(with searchTerm: String, completion: @escaping ([SearchItem]) -> Void) {
        guard let safeSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let urlString = "https://api.nal.usda.gov/ndb/search/?api_key=\(APIKeys.USDA_APIKey)&format=json&offset=0&max=50&sort=\(SearchSort.byFoodName.rawValue)&q=\(safeSearchTerm)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let searchResponse = try JSONDecoder().decode(USDASearchResponse.self, from: data)
                let searchResults = searchResponse.list.item
                completion(searchResults)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    //  MARK: Reports(version 1)
    //  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORT.md
    
    static func fetchFoodReportV1 (with ndbno: String, completion: @escaping (FoodV1) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/reports/?api_key=\(APIKeys.USDA_APIKey)&format=json&type=\(ReportType.basic.rawValue)&ndbno=\(ndbno)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let foodReportResponse = try JSONDecoder().decode(FoodReportResponseV1.self, from: data)
                let foodReport = foodReportResponse.report.food
                completion(foodReport)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    
    //  MARK: Reports (version 2)
    //  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORTV2.md
    
    static func fetchFoodReportV2 (with ndbno: String, completion: @escaping (FoodV2) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/V2/reports?api_key=\(APIKeys.USDA_APIKey)&format=json&type=\(ReportType.basic.rawValue)&ndbno=\(ndbno)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let foodReportResponse = try JSONDecoder().decode(FoodReportResponseV2.self, from: data)
                let foodReport = foodReportResponse.foods[0].food
                completion(foodReport)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
}
