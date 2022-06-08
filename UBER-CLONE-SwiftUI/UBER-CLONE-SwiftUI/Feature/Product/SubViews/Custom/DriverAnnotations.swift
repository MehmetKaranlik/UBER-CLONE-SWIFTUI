//
//  DriverAnnotations.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 7.06.2022.
//

import Foundation
import MapKit


class DriverAnnotation : NSObject, MKAnnotation {
  dynamic var coordinate: CLLocationCoordinate2D
   var uid : String

   init(uid : String , coordinate : CLLocationCoordinate2D) {
      self.uid = uid
      self.coordinate = coordinate
   }



   func updateLocation(withCoordinate coordinate : CLLocationCoordinate2D) {
      UIView.animate(withDuration: 0.2) {
         self.coordinate = coordinate
      }  
   }

}
