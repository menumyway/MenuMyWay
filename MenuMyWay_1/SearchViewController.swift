//
//  SearchViewController.swift
//  MenuMyWay_1
//
//  Created by Irais Gopar osorio on 4/22/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class SearchViewController: UIViewController,CLLocationManagerDelegate,UISearchBarDelegate {
    //@IBOutlet weak var searchMenu: UISearchBar!
    var  menuString : String = ""
    
    @IBOutlet weak var MenuLabel: UILabel!
    
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied ||  CLLocationManager.authorizationStatus() == .notDetermined {
                PlacesAPICaller.locationManager.requestWhenInUseAuthorization()
            }
            PlacesAPICaller.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            PlacesAPICaller.locationManager.delegate = self as? CLLocationManagerDelegate
            PlacesAPICaller.locationManager.startUpdatingLocation()
            //locationManager.requestLocation()
        } else {
            print("PLease turn on location services or GPS")
        }
        //        print("location?")
        //        print(locationManager.location?.coordinate)
        PlacesAPICaller.currentLat = PlacesAPICaller.locationManager.location?.coordinate.latitude ?? 0
        PlacesAPICaller.currentLong = PlacesAPICaller.locationManager.location?.coordinate.longitude ?? 0
        PlacesAPICaller.getDate()
        
    }
    
    @IBAction func searchButton(_ sender: Any) {
        PlacesAPICaller.venuName = searchBar.text ?? "nil"
        print("\(PlacesAPICaller.venuName)")
        PlacesAPICaller.getLocalVenus( completion: { (finished) in
            if (finished){
                print("success1")
                PlacesAPICaller.getVenueInfo { (finished, venue) in
                    if (finished){
                        print("success2")
                        PlacesAPICaller.getVenueID(venue: venue, venueName: PlacesAPICaller.venuName, completion: { (finished2, id)  in
                            if(finished2){
                                print("GOT VENUE ID")
                                print("\(PlacesAPICaller.venuName) = \(id)")
                                PlacesAPICaller.getMenu(venue_id: id, completion: { (gotMenu, menu) in
                                    if(gotMenu){
                                        print("Total Menus: \(menu.response.menu.menus.count)")
                                        PlacesAPICaller.printMenu(menu: menu)
                                        let menu_stuff = menu.response.menu.menus.items
                                        self.menuString = menu_stuff!.description
                                        //self.menuDetails.text = self.menuString
                                        //print(self.menuString)
                                        //counter = 2
                                    } else {
                                        print("Couldn't get menu :(")
                                        //self.menuString = "Menu not found"
                                        self.menuString = "Menu was not found for \(PlacesAPICaller.venuName)."
                                        //counter = 2
                                    }
                                })
                            }
                        })
                    }
                }
            }
        })
        print("________\(self.menuString)")
        self.MenuLabel.text = self.menuString
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
    @IBAction func exitKeyBoard(_ sender: Any) {
        view.endEditing(true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        PlacesAPICaller.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
}
