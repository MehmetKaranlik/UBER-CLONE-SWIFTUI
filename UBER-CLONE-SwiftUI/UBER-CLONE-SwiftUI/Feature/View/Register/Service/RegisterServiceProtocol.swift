//
//  RegisterServiceProtocol.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol RegisterServiceProtocol {
   typealias RegisterResult = (AuthDataResult?, Error?) -> Void
   typealias LoginResult = (AuthDataResult?,Error?) -> Void

   var auth : Auth { get }
   var database : Database { get }


   func register(email : String, password : String,
                 userType: Int, onComplete : @escaping RegisterResult)

   func login(email : String, password : String,onLogin : @escaping LoginResult)
}
