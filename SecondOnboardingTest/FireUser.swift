//
//  FireUser.swift
//  SecondOnboardingTest
//
//  Created by Giovanni Golino on 20/02/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

let defaultLocation = GeoPoint(latitude: 0, longitude: 0)

class FireUser: Equatable {
    static func == (lhs: FireUser, rhs: FireUser) -> Bool {
        lhs.objectId == rhs.objectId
    }
    
    
    var objectId: String = ""
    var email = ""
    var name: String = ""
    var age = 18
    var about = ""
    var location = defaultLocation
    
    // MARK: - SignUp
    class func signUpUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                // Handle the error
                print("Error creating user: \(error!.localizedDescription)")
                return
            }
            // User created successfully, so create a document in Firestore to store their data
            let db = Firestore.firestore()
            let userDocRef = db.collection("users").document(user.uid)
            // Generate a new object ID
            let objectId = user.uid
            
            // Set the initial user data
            let userData = [
                "objectID": objectId,
                "email": email,
                "name": "",
                "dateOfBirth": 18,
                "description": "",
                "location": defaultLocation
            ]
            
            // Add the user data to Firestore
            userDocRef.setData(userData) { error in
                if let error = error {
                    print("Error adding user data to Firestore: \(error.localizedDescription)")
                } else {
                    print("User created and data added to Firestore")
                    UserDefaults.standard.set(objectId, forKey: "objectId")
                }
            }
        }
    }
    
    // MARK: - Login
    
    class func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                // Handle the error
                print("Error signing in: \(error!.localizedDescription)")
                return
            }
            
            // Sign in successful, get the user data from Firestore
            //            let db = Firestore.firestore()
            //            let userDocRef = db.collection("users").document(user.uid)
            //
            //            userDocRef.getDocument { document, error in
            //                if let document = document, document.exists {
            //                    let data = document.data()
            // Do something with the user data, such as storing it in a User object
            //                } else {
            //                    print("Error getting user data from Firestore: \(error?.localizedDescription ?? "unknown error")")
            //                }
            //            }
        }
    }
    
    // MARK: - Update User
    
    
    // MARK: - Update User
    
    class func updateName(objectId: String, name: String) {
        let db = Firestore.firestore()
        let userDocRef = db.collection("users").document(objectId)
        userDocRef.updateData(["name": name]) { error in
            if let error = error {
                print("Error updating user name in Firestore: \(error.localizedDescription)")
            } else {
                print("User name updated in Firestore")
            }
        }
    }
    
    class func updateAge(objectId: String, age: Int) {
        let db = Firestore.firestore()
        let userDocRef = db.collection("users").document(objectId)
        userDocRef.updateData(["dateOfBirth": age]) { error in
            if let error = error {
                print("Error updating user age in Firestore: \(error.localizedDescription)")
            } else {
                print("User age updated in Firestore")
                
            }
        }
    }
    
    
    class func updateDescription(objectId: String, description: String, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()
        let userDocRef = db.collection("users").document(objectId)
        userDocRef.updateData(["description": description]) { error in
            if let error = error {
                print("Error updating user description in Firestore: \(error.localizedDescription)")
                completion(error)
            } else {
                print("User description updated in Firestore")
                completion(nil)
            }
        }
    }

    class func updateLocation(objectId: String, location: String) {
        let db = Firestore.firestore()
        let userDocRef = db.collection("users").document(objectId)
        userDocRef.updateData(["location": location]) { error in
            if let error = error {
                print("Error updating user location in Firestore: \(error.localizedDescription)")
            } else {
                print("User location updated in Firestore")
            }
        }
    }
    
}
