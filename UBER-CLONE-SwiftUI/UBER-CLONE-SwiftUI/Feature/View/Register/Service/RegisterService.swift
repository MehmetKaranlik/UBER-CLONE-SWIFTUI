//
//  RegisterService.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

// MARK: imports

import CoreLocation
import FirebaseAuth
import FirebaseDatabase
import Foundation
import GeoFire

// MARK: service

struct RegisterService: RegisterServiceProtocol {
   // MARK: properties

   var auth: Auth = .auth()
   var database: Database = .database()
   var geofire: GeoFire = .init(firebaseRef: DRIVER_LOCATIONS_REF)

   // MARK: functions

   func register(
      email: String,
      password: String,
      userType: Int,
      location: CLLocation?,
      onComplete: @escaping RegisterResult
   ) {
      auth.createUser(withEmail: email, password: password) { result, registerError in
         if let error = registerError { print("Register error : \(error)"); return }
         guard let uid = result?.user.uid else { return }

         let credentials = generateUserCredential(
            email: email, password: password,
            uid: uid, userType: userType
         )
         USER_DB_REF.child(uid).updateChildValues(credentials) { error, _ in
            if let error = error { print("Database register error : \(error)"); return }
            onComplete(result, registerError)
         }
         if userType == 1 {
            geofire.setLocation(location!, forKey: uid) { error in
               if let error = error { print("Something went wrong with registering location : \(error)"); return }
            }
         }
      }
   }

   private func generateUserCredential(
      email: String, password: String,
      uid: String, userType: Int
   ) -> [String: Any] {
      let credentials = ["email": email, "password": password,
                         "usertype": userType] as [String: Any]
      return credentials
   }

   func login(email: String, password: String, onLogin: @escaping LoginResult) {
      auth.signIn(withEmail: email, password: password, completion: onLogin)
   }
}
