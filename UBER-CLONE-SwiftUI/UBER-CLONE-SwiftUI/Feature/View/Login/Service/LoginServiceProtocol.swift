//
//  LoginServiceProtocol.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 7.06.2022.
//

import Foundation
import FirebaseAuth

protocol LoginServiceProtocol  {
   typealias LoginCompletion = (AuthDataResult?, Error?) -> Void
   var auth : Auth { get }

   func login(email: String, password: String, onResult : @escaping LoginCompletion)
}
