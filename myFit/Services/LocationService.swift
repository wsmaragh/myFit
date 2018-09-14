//
//  LocationService.swift
//  myFit
//
//  Created by Winston Maragh on 9/6/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class LocationService: NSObject {
    
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    static let shared = LocationService()
    
    private var locationManager: CLLocationManager!
    
    
    public func checkForLocationServices() -> CLAuthorizationStatus {
        
        var status: CLAuthorizationStatus!
        
        if CLLocationManager.locationServicesEnabled() {
            
            switch CLLocationManager.authorizationStatus() {
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                status = CLAuthorizationStatus.notDetermined
                
            case .denied:
                status = CLAuthorizationStatus.denied
                guard let validSettingsURL: URL = URL(string: UIApplicationOpenSettingsURLString) else {return status}
                UIApplication.shared.open(validSettingsURL, options: [:], completionHandler: nil)
                
            case .authorizedWhenInUse:
                status = CLAuthorizationStatus.authorizedWhenInUse
                
            case .authorizedAlways:
                status = CLAuthorizationStatus.authorizedAlways
                
            case .restricted:
                status = CLAuthorizationStatus.restricted
                guard let validSettingsURL: URL = URL(string: UIApplicationOpenSettingsURLString) else {return status}
                UIApplication.shared.open(validSettingsURL, options: [:], completionHandler: nil)
            }
        }

        else {
            
            //TODO: Remove
            print("location services NOT available")
            print("update UI to show location is not available")
            
        }
        
        return status
    }
    
}


//MARK: CLLocationManager Delegate
extension LocationService: CLLocationManagerDelegate {
    
    func determineMyLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { print("no locations"); return }
        //        guard let location = locations.first else { print("no locations"); return }
        
        UserPreferenceService.shared.setLatitude(latitude: location.coordinate.latitude)
        UserPreferenceService.shared.setLongitude(longitude: location.coordinate.longitude)
        
        //        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        //        let region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpan(latitudeDelta: 0.045, longitudeDelta: 0.045))
        //        mapView.setRegion(region, animated: true)
        //        mapView.showsUserLocation = true
        //        locationManager.stopUpdatingLocation()
        
    }
    

    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
//        let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 100, 100)
//        searchView.searchMap.setRegion(region, animated: true)
        //        searchView.searchMap.showsUserLocation = true
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Location Manager: did fail with error: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        print("Location Manager: did change Authorization: \(status)")
    }
    
}

