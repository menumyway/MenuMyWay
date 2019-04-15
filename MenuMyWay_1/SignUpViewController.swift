//
//  SignUpViewController.swift
//  MenuMyWay_1
//
//  Created by Maria Evelin Anda-Murillo on 4/8/19.
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
        
       /** Auth.auth().createUser(withEmail: emailField.text, password: passwordField.text){ user;, error }; in
        if User() != nil
        {
            print("user created")
            self.performSegue(withIdentifier: "SignIn", sender: self)
            
        }
        else {
            print( "error")
        }
 **/
    }
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

}
