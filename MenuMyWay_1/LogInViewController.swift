//
//  LogInViewController.swift
//  MenuMyWay_1
//
//  Created by Celina Juarez on 4/15/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LogInViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    @IBAction func onSignup(_ sender: Any) {
        
        if let email =  emailField.text,let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "SignIn", sender: nil)
                } else {
                    let alert = UIAlertController(title: "ERROR" , message: "Could not find account", preferredStyle: .alert)
                    
                    let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    
                    alert.addAction(okButton)
                    self.present(alert,animated:true, completion:nil)
                    
                }
            }
        }
        
        func sub(alert: UIAlertAction)
        {
            print("Error")
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
