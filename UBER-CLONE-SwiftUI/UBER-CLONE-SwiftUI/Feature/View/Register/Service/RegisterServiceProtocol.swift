//
//  RegisterServiceProtocol.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import MapKit
import GeoFire

protocol RegisterServiceProtocol {
   // MARK:  aliases
   typealias RegisterResult = (AuthDataResult?, Error?) -> Void
   typealias LoginResult = (AuthDataResult?,Error?) -> Void

   //properties
   var auth : Auth { get }
   var database : Database { get }
   var geofire : GeoFire { get }

   //functions
   func register(email : String, password : String,
                 userType: Int,location : CLLocation?, onComplete : @escaping RegisterResult)

   func login(email : String, password : String,onLogin : @escaping LoginResult)
}
