//
//  FileManagerService.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation
import UIKit


class FileManagerService {
    private init(){}
    static let shared = FileManagerService()
    
    private enum FilePath: String {
        case venuesFilePath = "Venues.plist"
        case eventsFilePath = "Events.pList"
        case articlesFilePath = "Articles.pList"
        case routinesFilePath = "Routines.pList"

    }
    
    private var venues = [Business]() {
        didSet {
            saveData(fileName: .venuesFilePath)
        }
    }
    
    private var events = [EBEvent]() {
        didSet {
            saveData(fileName: .eventsFilePath)
        }
    }
    
    private var articles = [Article]() {
        didSet {
            saveData(fileName: .articlesFilePath)
        }
    }
    
    private var routines = [Routine]() {
        didSet {
            saveData(fileName: .routinesFilePath)
        }
    }
    
    // Create
    func add(event: EBEvent) {
        events.insert(event, at: 0)
    }
    
    func add(venue: Business) {
        venues.insert(venue, at: 0)
    }
    
    func add(article: Article) {
        articles.insert(article, at: 0)
    }
    
    func add(routine: Routine) {
        routines.insert(routine, at: 0)
    }
    
    
    // Retrieve
    func getVenues() -> [Business] {
        loadData(fileName: .venuesFilePath)
        return venues
    }
    
    func getEvents() -> [EBEvent] {
        loadData(fileName: .eventsFilePath)
        return events
    }
    
    func getArticles() -> [Article] {
        loadData(fileName: .articlesFilePath)
        return articles
    }
    
    func getRoutines() -> [Routine] {
        loadData(fileName: .routinesFilePath)
        return routines
    }
    
    // Update
    func updateRoutine(routine: Routine) -> Bool {
        
        return true
    }
    
    
    //delete
    func deleteVenue(index: Int) {
        venues.remove(at: index)
    }
    
    func deleteAllVenues(){
        venues.removeAll()
    }
    
    func deleteEvent(index: Int) {
        events.remove(at: index)
    }
    
    func deleteAllEvents(){
        events.removeAll()
    }

    func deleteArticle(index: Int) {
        articles.remove(at: index)
    }
    
    func deleteAllArticles(){
        articles.removeAll()
    }
    
    func deleteRoutine(index: Int) {
        routines.remove(at: index)
    }
    
    func deleteAllRoutines(){
        routines.removeAll()
    }
    
    private func saveData(fileName: FilePath) {
        do {
            switch fileName {
            case .eventsFilePath:
                let phoneDataURL = getPathName(fromFileName: fileName.rawValue)
                let encodedData = try PropertyListEncoder().encode(events)
                try encodedData.write(to: phoneDataURL, options: .atomic)
            case .venuesFilePath:
                let phoneDataURL = getPathName(fromFileName: fileName.rawValue)
                let encodedData = try PropertyListEncoder().encode(venues)
                try encodedData.write(to: phoneDataURL, options: .atomic)
            case .articlesFilePath:
                let phoneDataURL = getPathName(fromFileName: fileName.rawValue)
                let encodedData = try PropertyListEncoder().encode(articles)
                try encodedData.write(to: phoneDataURL, options: .atomic)
            case .routinesFilePath:
                let phoneDataURL = getPathName(fromFileName: fileName.rawValue)
                let encodedData = try PropertyListEncoder().encode(routines)
                try encodedData.write(to: phoneDataURL, options: .atomic)
            }
        }
        catch {print(error.localizedDescription)}
    }
    
    
    private func loadData(fileName: FilePath) {
        do {
            let phoneDataURL = getPathName(fromFileName: fileName.rawValue)
            let encodedData = try Data(contentsOf: phoneDataURL)
            
            switch fileName {
            case .eventsFilePath:
                let savedEvents = try PropertyListDecoder().decode([EBEvent].self, from: encodedData)
                events = savedEvents
            case .venuesFilePath:
                let savedVenues = try PropertyListDecoder().decode([Business].self, from: encodedData)
                venues = savedVenues
            case .articlesFilePath:
                let savedEvents = try PropertyListDecoder().decode([Article].self, from: encodedData)
                articles = savedEvents
            case .routinesFilePath:
                let savedVenues = try PropertyListDecoder().decode([Routine].self, from: encodedData)
                routines = savedVenues
            }
        }
        catch {print(error.localizedDescription)}
    }
    
    
    func getPathName(fromFileName: String) -> URL {
        let documentDirectoryPath = FileManagerService.shared.getDocumentDirectoryPath()
        return documentDirectoryPath.appendingPathComponent(fromFileName)
    }
    
    
    func getDocumentDirectoryPath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentPath = paths[0]
        return documentPath
    }
    
}






