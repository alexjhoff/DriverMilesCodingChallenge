//
//  LocationViewModel.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/10/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationDelegate {
    func updateLocation(lat: String, long: String)
}

class LocationViewModel: NSObject {
    var delegate: LocationDelegate?
    var locationManager: CLLocationManager?
    var deferringUpdates = true
    var timer = Timer()
    
    override init() {
        super.init()
        
        initLocationManager()
        initTimer()
    }
    
    func initLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.pausesLocationUpdatesAutomatically = false
        getLocationUpdate()
    }
    
    func initTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { (timer) in
            self.getLocationUpdate()
        })
    }
    
    func getLocationUpdate() {
        // Request a location update
        locationManager?.requestLocation()
    }
    
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Process the received location update
        if let location = locationManager?.location?.coordinate {
            let latString = String(describing: location.latitude)
            let longString = String(describing: location.longitude)
            
            delegate?.updateLocation(lat: latString, long: longString)
            
            let post = Post(lat: latString, long: longString)
            ApiRequest.shared.submitPost(post: post, completion: { (error) in
                print("ERROR: ", error)
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager?.stopUpdatingLocation()
    }

}
