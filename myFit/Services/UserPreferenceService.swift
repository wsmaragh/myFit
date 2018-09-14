//
//  UserPreferenceService.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


struct UserKeys {
    static let currentLatitudeKey = "Current Latitude Key"
    static let currentLongitudeKey = "Current Longitude Key"
    static let currentAddressKey = "Current Address Key"
}


class UserPreferenceService {
    private init(){}
    static let shared = UserPreferenceService()
    
    public func setLatitude(latitude: Double) {
        UserDefaults.standard.set(latitude, forKey: UserKeys.currentLatitudeKey)
    }
    
    public func setLongitude(longitude: Double) {
        UserDefaults.standard.set(longitude, forKey: UserKeys.currentLongitudeKey)
    }
    
    public func setAddress(address: String) {
        UserDefaults.standard.set(address, forKey: UserKeys.currentAddressKey)
    }
    
    public func getLatitude() -> Double {
        return UserDefaults.standard.object(forKey: UserKeys.currentLatitudeKey) as? Double ?? 40.6863219
    }
    
    public func getLongitude() -> Double {
        return UserDefaults.standard.object(forKey: UserKeys.currentLongitudeKey) as? Double ?? -73.9805194

    }
    
    public func getAddress() -> String {
        return UserDefaults.standard.object(forKey: UserKeys.currentAddressKey) as? String ?? "NewYorkCity"
    }
    
}

