//
//  HomeViewModel.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 2.06.2022.
//

import Foundation
import MapKit


class HomeViewModel : ObservableObject {

   var locationManager = LocationManager()


   init() {
      updateRegion()
   }




   private func updateRegion() {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
         self.locationManager.$region.sink(receiveValue: { region in
            print(region)
         })
      }
}
}
