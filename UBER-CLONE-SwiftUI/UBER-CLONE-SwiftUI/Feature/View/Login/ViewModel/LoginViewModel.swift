//
//  LoginViewModel.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 19.04.2022.
//

import Foundation


class LoginViewModel : ObservableObject {
   // MARK:  properties
   let service = LoginService()
   //published properties
   @Published var userNameText  : String = ""
   @Published var password : String = ""
   @Published var isLeavingScene : Bool = false
   @Published var isLoading : Bool = false



   // MARK:  functions
   func login(email: String, password: String) {
      isLoading.toggle()
      service.login(email: email, password: password) { [unowned self]result, error in
         if let error = error {
            isLoading.toggle()
            print("Error while loggin in : \(error)")
            return
         }else{
            isLoading.toggle()
            isLeavingScene.toggle()
         }

      }
   }
 
}
