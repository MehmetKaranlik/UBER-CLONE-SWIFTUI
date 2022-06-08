//
//  LocationManager.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 2.06.2022.
//

import CoreLocation
import Foundation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
   var manager: CLLocationManager?
   var permissionStatus: CLAuthorizationStatus?

   static let shared = LocationManager()

   @Published var location = CLLocation() {
      didSet {
         updateLocation()
         
      }
   }

   @Published var region = MKCoordinateRegion()

   override init() {
      super.init()
      checkIfLocationServicesEnabled {
         manager?.delegate = self
         manager!.desiredAccuracy = kCLLocationAccuracyBest
         manager!.requestWhenInUseAuthorization()
         manager!.requestLocation()
      }
   }

   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      guard let lastKnownLocation = locations.last else { return }
      location = lastKnownLocation
   }

   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print(error)
   }

   internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
      switch manager.authorizationStatus {
         case .denied:
            print("denied")
         case .restricted:
            print("restricted")
         case .notDetermined:
            manager.requestWhenInUseAuthorization()
         case .authorizedWhenInUse:
            updateCoordinate(manager.location!)
         default: break
      }
   }

   private func checkIfLocationServicesEnabled(onEnabled: () -> Void) {
      if CLLocationManager.locationServicesEnabled() {
         manager = CLLocationManager()
         onEnabled()
      }
   }

   private func updateLocation() {
      DispatchQueue.main.async {
         self.region = MKCoordinateRegion(center: self.location.coordinate,
                                          span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
      }
   }

   private func updateCoordinate(_ location: CLLocation) {
      self.location = location
   }
}
