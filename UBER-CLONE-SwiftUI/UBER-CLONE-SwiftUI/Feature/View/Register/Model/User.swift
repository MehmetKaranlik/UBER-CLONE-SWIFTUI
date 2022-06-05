//
//  User.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import Foundation

struct User:  Codable {
   let username,password : String
   let usertype : UserType.RawValue
}

enum UserType  : String {
   case driver = "driver"
   case rider = "rider"
}
