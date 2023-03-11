//
//  LoginViewController.swift
//  SecondOnboardingTest
//
//  Created by Giovanni Golino on 17/02/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
            guard let email = emailTextField.text, let password = passwordTextField.text else {
                print("Please enter your email and password")
                return
            }
            FireUser.loginUser(email: email, password: password)
        }
    }
    


