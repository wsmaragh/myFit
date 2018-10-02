//
//  News.swift
//  myFit
//
//  Created by Winston Maragh on 9/10/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct NewsAPIJSON: Codable {
    var totalResults: Int //4941
    var articles: [Article]
}

struct Article: Codable {
    var title: String
    var author: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var source: ArticleSource
}

struct ArticleSource: Codable {
    var name: String?
}
