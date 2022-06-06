//
//  Placemark+Extensions.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 6.06.2022.
//

import Foundation
import MapKit

extension MKPlacemark {

   func buildAdress() -> String {
      var address = String()
      if let street = self.thoroughfare {
         address.append(street + ", ")
      }
      if let city = self.locality {
         address.append(city + ", ")
      }
      if let countryCode = self.countryCode {
         address.append(countryCode)
      }
      return address
   }
}
