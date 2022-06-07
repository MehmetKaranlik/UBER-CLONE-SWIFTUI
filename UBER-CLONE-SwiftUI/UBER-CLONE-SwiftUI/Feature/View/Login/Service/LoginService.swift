//
//  LoginService.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 7.06.2022.
//

import Foundation
import FirebaseAuth

struct LoginService : LoginServiceProtocol {
   var auth: Auth = Auth.auth()

   func login(email: String, password: String, onResult: @escaping LoginCompletion) {
      auth.signIn(withEmail: email, password: password, completion: onResult)
   }


}
