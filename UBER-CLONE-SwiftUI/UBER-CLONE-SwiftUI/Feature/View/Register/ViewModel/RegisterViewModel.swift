//
//  RegisterViewMode.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 4.05.2022.
//

import Foundation
import CoreLocation

class RegisterViewModel: ObservableObject {

   // MARK:  properties
   let service : RegisterService = RegisterService()
   let locationManager : LocationManager = .shared
   var location : CLLocation {
      return locationManager.location
   }
   // published properties
   @Published var isDriver: Int = 0

   @Published var emailValue: String = ""

   @Published var passwordValue: String = ""

   @Published var isLoading : Bool = false

   @Published var isNavigating : Bool = false

   // MARK:  functions

   func registerUser(email: String, password : String) {

      isLoading.toggle()
      print("Email" +  email)
      print("Passowrd : " + password)
      service.register(email: email, password: password, userType: isDriver,location: location) {[weak self] result, error in
         self?.isLoading.toggle()

         if let error = error  { print("Error while registering : \(error)");  return }
         self?.service.login(email: email, password: password) {[weak self] result, error in
            if let error = error { print("Error while loggin in : \(error)"); return}
            if let _ = result?.user.uid {
               self?.isNavigating.toggle()
            }
         }

      }
   }


}
