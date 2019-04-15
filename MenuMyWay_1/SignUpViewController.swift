//
//  SignUpViewController.swift
//  MenuMyWay_1
//
//  Created by Celina Juarez on 4/15/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var emailField: UITextField!
    
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func onSignup(_ sender: Any) {
        
        
        let email = emailField.text
        let password = passwordField.text
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (user,error) in
            if (error != nil)  {
                print("cant sign in user")
            } else {
                self.performSegue(withIdentifier: "SignUp", sender: nil)
            }
        
        
        
        
    }
        func viewDidLoad() {
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

}
}
