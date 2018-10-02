//
//  Business.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//
import Foundation


struct BusinessJSON: Codable {
    var businesses: [YelpBusiness]
    var total: Int
}

struct YelpBusiness: Codable {
    var id: String
    var name: String
    var image_url: String?
    var rating: Float?
    var review_count: Int
    var is_closed: Bool
    var categories: [BusinessCategory]
    var url: String
    var coordinates: Coordinate
    var display_phone: String?
    var distance: Double
    var location: BusinessLocation
}

struct BusinessCategory: Codable {
    var title: String
}

struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
    
}

struct BusinessLocation: Codable {
    var address1: String?
    var city: String?
    var state: String?
    var zip_code: String?
}
