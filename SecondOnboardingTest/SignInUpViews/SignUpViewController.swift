//
//  SignUpViewController.swift
//  SecondOnboardingTest
//
//  Created by Giovanni Golino on 17/02/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        if isTextDataPresent() {
            if passwordTextField.text == confirmPasswordTextField.text {
                FireUser.signUpUser(email: emailTextField.text!, password: passwordTextField.text!)
            }
            }
    }
    
    
    private func isTextDataPresent() -> Bool {
        emailTextField.text != nil && passwordTextField.text != nil && confirmPasswordTextField.text != nil
    }
    
  

}
