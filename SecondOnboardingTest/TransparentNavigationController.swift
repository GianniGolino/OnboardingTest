//
//  TranslucentNavigationController.swift
//  SecondOnboardingTest
//
//  Created by Giovanni Golino on 22/02/23.
//

import Foundation

import UIKit

class TransparentNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the navigation bar to be transparent
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
}
