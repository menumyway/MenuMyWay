//
//  homeViewController.swift
//  MenuMyWay_1
//
//  Created by Celina Juarez on 5/6/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import Firebase


class homeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onLogout(_ sender: Any) {
        
        try! Auth.auth().signOut()
        if let storyboard = self.storyboard {
            let vc = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            self.present(vc, animated: false, completion: nil)
        
        
    }
}
}
