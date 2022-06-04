//
//  HomeService.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 3.06.2022.
//

import Foundation
import MapKit


struct HomeService : HomeServiceProtocol {





   func fetchSearchPlaces(languageQuery : String,region : MKCoordinateRegion, completion : @escaping Completion) {
      var results = [MKPlacemark]()
      let request = MKLocalSearch.Request()
      request.region = region
      request.naturalLanguageQuery = languageQuery
      let search = MKLocalSearch(request: request)
      search.start { response, error in
         if let error = error {
            debugPrint("Error while fetching places : \(error)")
            return
         }
         guard let response = response else { return }
         response.mapItems.forEach { item in
            results.append( item.placemark)
         }
         completion(results)
      }
   }

   func generatePolylineByIndex(_ toDestination : MKMapItem, completion : @escaping PolylineCompletion) {
      let request = MKDirections.Request()
      request.source = MKMapItem.forCurrentLocation()
      request.destination = toDestination
      request.transportType = .automobile
      let direction = MKDirections(request: request)
      direction.calculate { response, error in
         if let error = error {
            print("Error while fetching route : \(error)")
            return
         }
         guard let response = response else { return }
         let route = response.routes[0]
         let polyLine = route.polyline
         completion(polyLine)
      }

   }
}
