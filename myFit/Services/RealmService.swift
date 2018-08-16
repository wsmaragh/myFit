//
//  RealmService.swift
//  Fit
//
//  Created by Winston Maragh on 7/15/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//


import Foundation
import RealmSwift

class RealmService {
    
    private init() {}
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    //CREATE
    func create<T: Object>(_ realmObject: T) {
        do {
            try realm.write {
                realm.add(realmObject)
            }
        } catch {
            print("Realm Error: ", error)
            print("Realm Error Description: ", error.localizedDescription)
        }
    }
    
    //READ
    func read<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
    
    //UPDATE
    func update<T: Object>(_ realmObject: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    realmObject.setValue(value, forKey: key)
                }
            }
        } catch {
            print("Realm Error: ", error)
            print("Realm Error Description: ", error.localizedDescription)
        }
    }
    
    //DELETE
    func delete<T: Object>(_ realmObject: T) {
        do {
            try realm.write {
                realm.delete(realmObject)
            }
        } catch {
            print("Realm Error: ", error)
            print("Realm Error Description: ", error.localizedDescription)        }
    }
    
    
}


