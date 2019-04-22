//
//  SearchViewController.swift
//  MenuMyWay_1
//
//  Created by Irais Gopar osorio on 4/22/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController,CLLocationManagerDelegate,UISearchBarDelegate {
    

    var locationManager = CLLocationManager()
    @IBOutlet weak var searchVenue: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchVenue.delegate = self
        
        print("searchVenue text?")
        print(searchVenue.text)
        
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied ||  CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            print("PLease turn on location services or GPS")
        }
        print("location?")
        print(locationManager.location as Any)
        // Do any additional setup after loading the view.
    }

    
    

    @IBAction func tapScreen(_ sender: Any) {
        view.endEditing(true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    print("do stuff")
                }
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
}
