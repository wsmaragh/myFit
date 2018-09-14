//
//  NewsAPIService.swift
//  myFit
//
//  Created by Winston Maragh on 9/10/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import Alamofire

    
class ArticlesAPIService {
    
    private init(){}
    static let shared = ArticlesAPIService()
    
    func getFitnessArticles(completion: @escaping ([Article]) -> Void) {
        
        let q = "fitness exercise workout".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = "https://newsapi.org/v2/everything?apiKey=\(APIKeys.NewsAPI_ApiKey)&sortBy=publishedAt&language=en&q=\(q!)"

        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(NewsAPIJSON.self, from: data)
                        let articles = JSON.articles
                        completion(articles)
                    }
                    catch {print("Error processing data. Error: \(error)")}
                }
            } else {
                print("Error\(String(describing: response.result.error))")
            }
        }
    }
    
    func getFoodArticles(completion: @escaping ([Article]) -> Void) {
        let q = "food".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = "https://newsapi.org/v2/everything?apiKey=\(APIKeys.NewsAPI_ApiKey)&sortBy=publishedAt&language=en&q=\(q!)"
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let data = response.data {
                    do {
                        let JSON = try JSONDecoder().decode(NewsAPIJSON.self, from: data)
                        let articles = JSON.articles
                        completion(articles)
                    }
                    catch {print("Error processing data. Error: \(error)")}
                }
            } else {
                print("Error\(String(describing: response.result.error))")
            }
        }
    }
    
}












