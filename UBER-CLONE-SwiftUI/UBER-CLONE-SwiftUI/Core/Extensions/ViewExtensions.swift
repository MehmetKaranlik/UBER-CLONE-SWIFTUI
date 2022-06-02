//
//  ViewExtensions.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 2.06.2022.
//

import Foundation
import SwiftUI
import MapKit


extension View {
  static func returnSizeProperties() -> [String: Double] {
      return ["x" : 0, "y" : 0, "width" : Double(UIScreen.main.bounds.width),
              "height" : Double(UIScreen.main.bounds.height)]
   }

   

}
