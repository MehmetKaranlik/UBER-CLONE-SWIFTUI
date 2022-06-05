//
//  JsonObjectWrapper.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import Foundation
import SwiftUI


@propertyWrapper
struct JsonObject<Content: Decodable> : DynamicProperty {
  var value : Content
  lazy var mirror = Mirror(reflecting: value)


   var wrappedValue : Content {
      get {
         value
      }
      mutating set  {
         guard let newValue  = newValue as? Data else { return }
         do {
         value = try  JSONDecoder.init().decode(Content.self, from: newValue)
         }catch let e {
            print(e.localizedDescription)
         }
         }
      }
   }

