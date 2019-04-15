//
//  LogInViewController.swift
//  MenuMyWay_1
//
//  Created by Maria Evelin Anda-Murillo on 4/8/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase 

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    @IBAction func OnSignUp(_ sender: Any) {
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        
       
        
        
if let email =  usernameField.text,let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "SignIn", sender: nil)
                } else {
                    Auth.auth().createUser(withEmail: email, password: password) { (user,error) in
                        if (error != nil)  {
                            print("cant sign in user")
                        } else {
                            self.performSegue(withIdentifier: "SignIn", sender: nil)
                        }
                    }
                }
            }
            
        }

        
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
