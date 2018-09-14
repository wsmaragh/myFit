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
    var title: String // "Gym Exercises & Workouts v2.73"
    var author: String? // "noreply@blogger.com (ANROED)"
    var description: String? //"<!--Overview-->Buy <!--end--> <!--Description-->Gym Exercises & Workouts is a 100% free workout logger, tracker and library of over 110 exercises separated into targeted muscle groups that show simple, moving figures performing the correct beginning and final…"
    var url: String? // "https://www.apkmania.live/2018/06/gym-exercises-workouts.html"
    var urlToImage: String? // "https://lh3.googleusercontent.com/2sb_OT4SqhkVMdazbxW70dwdWQYkPqrnIowzTBcVPFycO31FYDzmxZMG3uvTpVCAPzQ=s72-c-h450"
    var publishedAt: String? // "2018-09-10T17:47:00Z"
        var source: ArticleSource
}

struct ArticleSource: Codable {
    var name: String? //"Apkmania.live"
}
