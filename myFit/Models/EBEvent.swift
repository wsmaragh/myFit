//
//  EBEvent.swift
//  myFit
//
//  Created by Winston Maragh on 9/7/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


// EventBrite
struct EventSearchJSON: Codable {
    let events: [EBEvent]
}

struct EBEvent: Codable {
    let id: String
    let name: NameDict
    let description: DescriptionDict
    let url: String // The URL to the event page for this event on Eventbrite
    let start: StartDict? // The start time of the event
    let end: EndDict? // The end time of the event
    let status: String // canceled, live, started, ended, completed
    let currency: String // The ISO 4217 currency code for this event
    let online_event: Bool // If this event doesn’t have a venue and is only held online
    let is_free: Bool // true or false
}

struct NameDict: Codable {
    let text: String // "Wanderlust 108 Brooklyn 2018",
}

struct DescriptionDict: Codable {
    let text: String?
}

struct StartDict: Codable {
    let local: String // "2018-09-09T07:30:00"
}

struct EndDict: Codable {
    let local: String // "2018-09-09T15:00:00"
}

