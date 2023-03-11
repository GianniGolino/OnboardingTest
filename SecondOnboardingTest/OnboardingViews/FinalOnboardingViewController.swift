//
//  FinalOnboardingViewController.swift
//  SecondOnboardingTest
//
//  Created by Giovanni Golino on 24/02/23.
//

import UIKit
import CoreLocation

class FinalOnboardingViewController: UIViewController {

    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var viewUnderLabel: UIView!
    @IBOutlet weak var cityAndCountryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        
    }
    

    private func updateView() {
        locationButton.layer.cornerRadius = 10
        locationButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        viewUnderLabel.layer.cornerRadius = 10
        viewUnderLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }

}
