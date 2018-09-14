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
    var id: String // "new-york-yelp-summer-camp-kick-butt-with-brooklyn-bridge-boot-camp",
    var name: String // "Yelp Summer Camp: Kick Butt With Brooklyn Bridge Boot Camp!",
    var description: String  //"Are BBQs, beer, and general summer merriment getting you a little bit out of shape? Let Ariane of the top-rated Brooklyn Bridge Boot Camp whip you into...",
    var image_url: String // "https://s3-media2.fl.yelpcdn.com/ephoto/y3Np4XTsp3xOXxYxT31U5w/o.jpg",
    var event_site_url: String? //"https://www.yelp.com/events/new-york-yelp-summer-camp-kick-butt-with-brooklyn-bridge-boot-camp?adjust_creative=dX8Gsd4LKUhbjjahyt9J8w&utm_campaign=yelp_api_v3&utm_medium=api_v3_event_search&utm_source=dX8Gsd4LKUhbjjahyt9J8w",
    var is_official: Bool // false
    var is_canceled: Bool // false
    var is_free: Bool // true
    var cost: Double? // null
    var cost_max: Double? // null
    var latitude: Double  // 40.6913770268785
    var longitude: Double // -74.0164375305176
    var tickets_url: String? // ""
    var time_start: String?  // "2010-08-21 21:00"
    var time_end: String? // null
    var cross_streets: String? // ""
    var business_id: String?
    var location: BusinessLocation
    var display_address: [String]? // ["10 S St", "Slip 7", "New York, NY 10004"]
}
