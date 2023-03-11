//
//  2ndOnboardingViewController.swift
//  SecondOnboardingTest
//
//  Created by Giovanni Golino on 17/02/23.
//

import UIKit

class SecondOnboardingViewController: UIViewController {

    @IBOutlet weak var aboutYouTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    @IBAction func nextPressed(_ sender: UIButton) {
        // Retrieve the objectId from UserDefaults
        if let objectId = UserDefaults.standard.string(forKey: "objectId") {
            FireUser.updateDescription(objectId: objectId, description: aboutYouTextView.text) { error in
                if let error = error {
                    print("Error updating user description: \(error.localizedDescription)")
                } else {
                    print("User description updated successfully")
                }
            }
        }
    }
    
}
