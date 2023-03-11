//
//  1stOnboardingViewController.swift
//  SecondOnboardingTest
//
//  Created by Giovanni Golino on 17/02/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


class FirstOnboardingViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    @IBAction func nextPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, let userId = Auth.auth().currentUser?.uid else {
                print("User not logged in or name not entered")
                return
            }

            let db = Firestore.firestore()
            let userDocRef = db.collection("users").document(userId)
        
            let today = Date()
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: datePicker.date, to: today)
            let age = ageComponents.year
        
        if age == nil {
            print("Please insert your date of birth")
            return
        }
            
        if let age = age {
            userDocRef.updateData(["name": name, "dateOfBirth": age]) { error in
                    if let error = error {
                        print("Error updating name in Firestore: \(error.localizedDescription)")
                    } else {
                        print("Name updated successfully")
                    }
                }
        }
        

    }
    
    @IBAction func dateSelected(_ sender: UIDatePicker) {
        
    }
  

        
    
    
    
        
    

}
