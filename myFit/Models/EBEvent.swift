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
    let url: String
    let start: StartDict?
    let end: EndDict?
    let status: String
    let currency: String
    let online_event: Bool
    let is_free: Bool
}

struct NameDict: Codable {
    let text: String
}

struct DescriptionDict: Codable {
    let text: String?
}

struct StartDict: Codable {
    let startTime: String
    
    private enum CodingKeys: String, CodingKey {
        case startTime = "local"
    }
}

struct EndDict: Codable {
    let endTime: String
    
    private enum CodingKeys: String, CodingKey {
        case endTime = "local"
    }
}

