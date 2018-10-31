//
//  YelpEvent.swift
//  myFit
//
//  Created by Winston Maragh on 9/11/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation

struct YelpEventJSON: Codable {
    var events: [YelpEvent]
    var total: Int
}

struct YelpEvent: Codable {
    var id: String
    var name: String
    var description: String
    var image_url: String
    var event_site_url: String?
    var is_official: Bool
    var is_canceled: Bool
    var is_free: Bool
    var cost: Double?
    var cost_max: Double?
    var latitude: Double
    var longitude: Double
    var tickets_url: String?
    var time_start: String?
    var time_end: String?
    var cross_streets: String?
    var business_id: String?
    var location: BusinessLocation
    var display_address: [String]?
}
