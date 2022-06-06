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
   @State private var value: Content?

   var wrappedValue: Content? {
      get {
         return value
      }
    nonmutating set {
         value = newValue
      }
   }
}

protocol FirebaseObjectMapping {
   mutating func setUpValues(dictionary: [String: Any?])
}
