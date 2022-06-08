//
//  HomeServiceProtocol.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 3.06.2022.
//

import Foundation
import GeoFire
import MapKit

protocol HomeServiceProtocol {
   // properties
   var geofire: GeoFire { get }
   var localSearchRequest: MKLocalSearch.Request { get }
   var directionRequest: MKDirections.Request { get }

   // aliases
   typealias Completion = ([MKPlacemark]) -> ()
   typealias PolylineCompletion = (MKPolyline) -> ()
   typealias DriverFetchingCompletion = (DriverAnnotation) -> ()
   //typealias UserFetchingCompletion = (MapEntity) -> ()

   // functions
   func fetchSearchPlaces(languageQuery: String, region: MKCoordinateRegion, completion: @escaping Completion)
   func generatePolylineByIndex(_ toDestination: MKMapItem, completion: @escaping PolylineCompletion)
   func fetchDrivers(location: CLLocation, onResult: @escaping DriverFetchingCompletion)
  // func fetchUserByUID(uid : String,onResult : @escaping UserFetchingCompletion)
}
