//
//  LocationManager.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 2.06.2022.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager :NSObject, CLLocationManagerDelegate, ObservableObject {

   var manager : CLLocationManager?
   var permissionStatus : CLAuthorizationStatus?
   @Published var region : MKCoordinateRegion =  MKCoordinateRegion()
   var location : CLLocation? {
      didSet {
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.region = MKCoordinateRegion(center: self.location!.coordinate, span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
         }
      }
   }




   override  init() {
      super.init()
      checkIfLocationServicesEnabled {
         manager?.delegate = self
         manager!.desiredAccuracy = kCLLocationAccuracyBest
         manager!.requestWhenInUseAuthorization()
         manager!.requestLocation()
      }

   }


  nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])  {
     
  }

   nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print(error)
   }


   internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)   {
      switch manager.authorizationStatus {
         case .denied:
            print("denied")

         case .restricted:
            print("restricted")
         case .notDetermined:
            manager.requestWhenInUseAuthorization()
         case .authorizedWhenInUse:
              updateLocation(manager.location!)
         default: break

      }
   }


  private func checkIfLocationServicesEnabled(onEnabled : () -> Void) {
      if CLLocationManager.locationServicesEnabled() {
         manager = CLLocationManager()
         onEnabled()
      }
   }

     private func updateLocation(_ location : CLLocation)   {
      Task {
         self.location =  location
      }
   }

}


