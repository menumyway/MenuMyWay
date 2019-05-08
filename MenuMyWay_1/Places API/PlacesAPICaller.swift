//
//  PlacesAPICaller.swift
//  MenuMyWay_1
//
//  Created by Celina Juarez on 5/8/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import MapKit
import AddressBook
import CoreLocation

class PlacesAPICaller {
    // Places API
    static let client_id = "DARACO2EGHSLMEKBKUAHPYUVW1J4HDJDOMKNW5CKRHILDWG1"
    static let client_secret = "TR5QAKFNF43WDZ24YW1QTVN3LN45B1KEOPQX5TFO5J4ZF3SD"
    static let locationManager = CLLocationManager()
    static var currentLat : Double = 0.0
    static var currentLong : Double = 0.0
    static var venuLat : Double = 0.0
    static var venuLong : Double = 0.0
    static var venuName : String = ""
    
    // Current Date
    static var current_date : String = ""
    
    // Requires current date in URL
    class func getDate() {
        // 1. Setup Date & Calendar
        let date = Date()
        let calendar = Calendar.current
        
        // 2. Get Date for Places API Request URLs
        let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: date)
        let year = components.year
        var formatted_month: String = ""
        var formatted_day: String = ""
        
        // 3. Format month
        if let unwrapped_month = components.month {
            if unwrapped_month >= 1 && unwrapped_month <= 9 {
                formatted_month = "0\(unwrapped_month)"
            } else {
                formatted_month = "\(unwrapped_month)"
            }
        }
        
        // 4. Format day
        if let unwrapped_day = components.day {
            if unwrapped_day >= 1 && unwrapped_day <= 9 {
                formatted_day = "0\(unwrapped_day)"
            } else {
                formatted_day = "\(unwrapped_day)"
            }
        }
        
        // 4. Setup Current Date
        current_date = "\(year!)\(formatted_month)\(formatted_day)"
    }
    
    class func getLocalVenus(completion: @escaping (Bool) -> Void){
        let request = MKLocalSearch.Request()
        request.region = MKCoordinateRegion(center: (PlacesAPICaller.locationManager.location?.coordinate)!, latitudinalMeters: 100000, longitudinalMeters: 100000)
        
        //  - Used to store all restaurants within the user location
        //        let defaults = UserDefaults.standard
        let categories = ["Restaurants", "Fast Food"]
        
        for category in categories {
            request.naturalLanguageQuery = category
            let search = MKLocalSearch(request: request)
            
            search.start { (response, error) in
                guard let response = response else { return }
                for item in response.mapItems{
                    print("\(String(describing: item.name))")
                    if(item.name == "\(venuName)"){
                        //                        print("names: \(String(describing: item.name))")
                        print("Coordinates: \(item.placemark.coordinate)")
                        venuLat = item.placemark.coordinate.latitude
                        venuLong = item.placemark.coordinate.longitude
                        completion(true)
                        break
                    }
                    else if(venuName == "mcdonalds"){
                        if(item.name == "McDonald's"){
                            print("Coordinates: \(item.placemark.coordinate)")
                            venuLat = item.placemark.coordinate.latitude
                            venuLong = item.placemark.coordinate.longitude
                            completion(true)
                            break
                        }
                    }
                    
                }
                completion(false)
            }
        }
        
    }
    
    class func getVenueInfo(completion: @escaping (Bool, Restaurant) -> Void){
        let responseURL = "https://api.foursquare.com/v2/venues/search?ll=\(venuLat),\(venuLong)&client_id=\(client_id)&client_secret=\(client_secret)&v=\(current_date)"
        print(responseURL)
        guard let url = URL(string: responseURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                
                let venues = try decoder.decode(Restaurant.self, from: data)
                
                if venues.response.venues.count > 0{
                    completion(true,venues)
                    
                } else{
                    completion(false, venues)
                }
                //print(venues)
            }catch let parsingError {
                print("Error",parsingError)
            }
            
            }.resume()
        
    }
    
    class func getVenueID(venue: Restaurant, venueName: String, completion: @escaping (Bool, String) -> Void) {
        let restaurants = venue.response.venues
        print("Getting Venue ID")
        for r in restaurants {
            if(r.name == "\(venueName)"){
                print("name: \(r.name)")
                print("id: \(r.id)")
                completion(true, r.id)
                break
            }
            if(venuName == "mcdonalds"){
                if(r.name == "McDonald's"){
                    print("name: \(r.name)")
                    print("id: \(r.id)")
                    completion(true, r.id)
                    break
                }
            }
        }
        completion(false, "error")
    }
    class func getMenu(venue_id : String, completion: @escaping (Bool, Menu) -> Void) {
        let menu_url = "https://api.foursquare.com/v2/venues/\(venue_id)/menu?client_id=\(client_id)&client_secret=\(client_secret)&v=\(current_date)"
        
        //  - Format URL
        guard let url = URL(string: menu_url) else { return }
        
        // 2. Parses JSON from "Menu" request
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                
                print("Checking Menu")
                let menu = try decoder.decode(Menu.self, from: data)
                
                // Ensures that the restaurant contains a menu
                let is_menu_available = menu.response.menu.menus.count > 0
                
                print("# of menus: \(menu.response.menu.menus.count)")
                
                if is_menu_available {
                    completion(true, menu)
                } else {
                    completion(false, menu)
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
            }.resume()
    }
    
    class func printMenu(menu : Menu) {
        let menus = menu.response.menu.menus.items
        
        for m in menus! {
            print("Name of Menu: \(m.name)")
            
            let sections = m.entries.items
            for s in sections! {
                print("\t\(s.name)")
                
                var counter = 1
                let food = s.entries.items
                for f in food {
                    print("\t\t\(counter)) \(f.name)")
                    counter += 1
                }
            }
        }
    }
}

