//
//  USDAFood.swift
//  myFit
//
//  Created by Winston Maragh on 8/21/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct USDAFoodAPIService {

    //  MARK: List - request a list of foods, nutrients or food groups.
    ////documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-LIST.md
    
    static func fetchFoodList(completion: @escaping (ListResponse) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/list?api_key=\(APIKeys.USDA_APIKey)&format=json&lt=\(ListType.food.rawValue)&sort=n"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let listResponse = try JSONDecoder().decode(ListResponse.self, from: data)
                completion(listResponse)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    static func fetchFoodGroupList(completion: @escaping ([Item]) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/list?api_key=\(APIKeys.USDA_APIKey)&format=json&lt=\(ListType.foodGroup.rawValue)"
        guard let url = URL(string: urlString) else {return}
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
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
    //documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-SEARCH.md
    
    static func fetchFoodSearch(with searchTerm: String, completion: @escaping (SearchResponse) -> Void) {
        let urlString =  "https://api.nal.usda.gov/ndb/search/?api_key=\(APIKeys.USDA_APIKey)&format=json&sort=n&max=25&offset=0&q=\(searchTerm)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
//                let foodGroupList = listResponse.list.item
                completion(searchResponse)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
            
        }
        task.resume()
    }
    
    
    //  MARK: Reports(version 1)
    //  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORT.md
    
    static func fetchFoodReportV1 (with ndbno: String, completion: @escaping (FoodReportResponseV1) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/reports/?api_key=\(APIKeys.USDA_APIKey)&format=json&type=b&ndbno=\(ndbno)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let foodReportResponse = try JSONDecoder().decode(FoodReportResponseV1.self, from: data)
//                let report =
                completion(foodReportResponse)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    
    //  MARK: Reports (version 2)
    //  documentation: https://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORTV2.md
    
    static func fetchFoodReportV2 (with ndbno: String, completion: @escaping (FoodReportResponseV2) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/V2/reports?api_key=\(APIKeys.USDA_APIKey)&format=json&type=b&ndbno=\(ndbno)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
            // if let httpResponse = httpResponse {print(httpResponse)}
            guard let data = data else {print("error getting data");return}
            do {
                let foodReportResponse = try JSONDecoder().decode(FoodReportResponseV2.self, from: data)
                //                let report =
                completion(foodReportResponse)
            } catch let jsonErr {
                print("error decoding JSON: ", jsonErr)
            }
        }
        task.resume()
    }
    
    
    //  MARK: fetch Generic Data
    
    static func fetchData<T: Codable>(urlString: String, completion: @escaping (T) -> Void) {
        let urlString = "https://api.nal.usda.gov/ndb/list?format=json&lt=g&api_key=\(ApiKey)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, httpResponse, err) in
            if let error = err {print(error)}
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
