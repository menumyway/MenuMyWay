//
//  SearchViewController.swift
//  MenuMyWay_1
//
//  Created by Irais Gopar osorio on 4/22/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import LocalAuthentication

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var searchVenue: UISearchBar!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tapScreen(_ sender: Any) {
        view.endEditing(true)
    }
}
