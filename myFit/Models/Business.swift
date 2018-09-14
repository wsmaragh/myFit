//
//  Business.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//
import Foundation


struct BusinessJSON: Codable {
    var businesses: [Business]
    var total: Int
}

struct Business: Codable {
    var id: String //
    var name: String //
    var image_url: String? // "https://s3-media4.fl.yelpcdn.com/bphoto/XQsZSv3mO7mPolG-76jc_g/o.jpg"
    var rating: Float? // 4.5
    var review_count: Int //
    var is_closed: Bool // Whether business has been (permanently) closed
    var categories: [BusinessCategory]
    var url: String //
    var coordinates: Coordinate
    var display_phone: String? // "(917) 849-9716"
    var distance: Double // 1191.652912638797  // decimal
    var location: BusinessLocation
}

struct BusinessCategory: Codable {
    var title: String
}

struct Coordinate: Codable {
    var latitude: Double // 40.6863219
    var longitude: Double // -73.9805194
    
}

struct BusinessLocation: Codable {
    var address1: String?
    var city: String?
    var state: String?
    var zip_code: String?
}
