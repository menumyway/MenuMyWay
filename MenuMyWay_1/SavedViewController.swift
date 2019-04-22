//
//  SavedViewController.swift
//  MenuMyWay_1
//
//  Created by Irais Gopar osorio on 4/15/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import Pilgrim
import FoursquareAPIClient

class SavedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func PlacesButton(_ sender: Any) {
        let jsonString = "https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=&client_secret=&v=20190417"
        
        guard let url = URL(string: jsonString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else {return}
            let dataAsString = String(data: data, encoding: .utf8)
            print("hello")
            print (dataAsString)
            
            
        }.resume()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
