//
//  User.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import Foundation

struct User: FirebaseObjectMapping {


   var username,password : String?
   var usertype : UserType.RawValue?

   init( _ dictionary : [String: Any?]?) {
      guard let dictionary = dictionary else {  return }
      setUpValues(dictionary: dictionary)
   }

   internal mutating func setUpValues(dictionary: [String : Any?]) {
      username = dictionary["username"] as? String
      password = dictionary["password"] as? String
      usertype = dictionary["usertype"] as? Int == 0 ? UserType.driver.rawValue : UserType.rider.rawValue
   }
}

enum UserType  : String {
   case driver = "driver"
   case rider = "rider"
}
