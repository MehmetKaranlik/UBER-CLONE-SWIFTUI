//
//  FirebaseObject.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import Foundation
import SwiftUI


@propertyWrapper
struct FirebaseObject<Content: FirebaseObjectMapping> : DynamicProperty {
   var value : Content


   var wrappedValue : Content {
      get {
         value
      }
      mutating set {
         guard let newValue = newValue as? [String : Any?] else { return }
         value.setUpValues(dictionary: newValue)
      }
   }
}


protocol FirebaseObjectMapping  {

   func setUpValues(dictionary : [String: Any?])
}
