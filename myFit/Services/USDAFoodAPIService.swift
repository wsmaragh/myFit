//
//  USDAFood.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


class USDAFoodAPIService {
    
    private init() {}
    static let shared = USDAFoodAPIService()
    
    //  MARK: Food Category List
    static func fetchFoodList(completion: @escaping ([FoodItem]) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/list?api_key=\(APIKeys.USDA_APIKey)&format=json&lt=\(ListType.food.rawValue)&sort=n"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                print();print("Http Response:", httpResponse.statusCode);print()
                if httpResponse.statusCode != 200 {return}
            }
            
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
    
    // Food Group List
    static func fetchFoodGroupList(completion: @escaping ([FoodItem]) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/list?api_key=\(APIKeys.USDA_APIKey)&format=json&lt=\(ListType.foodGroup.rawValue)"
        guard let url = URL(string: urlString) else {return}
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                print();print("Http Response:", httpResponse.statusCode);print()
                if httpResponse.statusCode != 200 {return}
            }
            
            guard let data = data else {print("error getting data");return}
            do {
                let listResponse = try JSONDecoder().decode(ListResponse.self, from: data)
                let foodGroupList = listResponse.list.item
                completion(foodGroupList)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
            
        }
        task.resume()
    }
    
    
    //  MARK: Search
    
    static func fetchFoodSearch(with searchTerm: String, completion: @escaping ([SearchItem]) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/search/?api_key=\(APIKeys.USDA_APIKey)&format=json&offset=0&max=50&sort=\(SearchSort.byFoodName.rawValue)&q=\(searchTerm)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                print();print("Http Response:", httpResponse.statusCode);print()
                if httpResponse.statusCode != 200 {return}
            }
            
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
    
    static func fetchFoodReportV1 (withID ndbno: String, completion: @escaping (FoodV1) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/reports/?api_key=\(APIKeys.USDA_APIKey)&format=json&type=\(ReportType.basic.rawValue)&ndbno=\(ndbno)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                print();print("Http Response:", httpResponse.statusCode);print()
                if httpResponse.statusCode != 200 {return}
            }
            
            guard let data = data else {print("error getting data");return}
            do {
                let foodReportResponse = try JSONDecoder().decode(FoodReportResponseV1.self, from: data)
                let food = foodReportResponse.report.food
                completion(food)
            } catch let jsonErr {
                print("FOOD REPORT v1 Error")
                print("error decoding JSON: ", jsonErr)
                print()
            }
        }
        task.resume()
    }
    
    
    
    //  MARK: Reports (version 2)
    //  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORTV2.md
    
    static func fetchFoodReportV2 (withID ndbno: String, completion: @escaping (FoodV2) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/V2/reports?api_key=\(APIKeys.USDA_APIKey)&format=json&type=\(ReportType.basic.rawValue)&ndbno=\(ndbno)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                print();print("Http Response:", httpResponse.statusCode);print()
                if httpResponse.statusCode != 200 {return}
            }
            
            guard let data = data else {print("error getting data");return}
            do {
                let foodReportResponse = try JSONDecoder().decode(FoodReportResponseV2.self, from: data)
                let report = foodReportResponse.foods[0].food
                completion(report)
            } catch let jsonErr {
                print("FOOD REPORT v2 Error")
                print("error decoding JSON: ", jsonErr)
                print()
            }
        }
        task.resume()
    }
    
    
    //  MARK: fetch Generic Data
    
    static func fetchData<T: Codable>(urlString: String, completion: @escaping (T) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/list?format=json&lt=g&api_key=\(APIKeys.USDA_APIKey)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            
            if let error = err {print(error)}
            
            if let httpResponse = httpResponse as? HTTPURLResponse {
                print();print("Http Response:", httpResponse.statusCode);print()
                if httpResponse.statusCode != 200 {return}
            }
            
            guard let data = data else {print("error getting data");return}
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
}
