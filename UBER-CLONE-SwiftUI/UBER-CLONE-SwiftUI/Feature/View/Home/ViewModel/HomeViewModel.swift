//
//  HomeViewModel.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 2.06.2022.
//

import Foundation
import MapKit
import SwiftUI
import MapKit
import Combine

class HomeViewModel : ObservableObject {
   // MARK:  properties
   var cancellables = Set<AnyCancellable>()
   let service = HomeService()
   weak var locationManger = LocationManager.shared


   //published properties
   @Published var searchInput : String = ""
   @Published var region = MKCoordinateRegion()
   @Published var mapAnnotations : [MKAnnotation]?
   @Published var selectedIndex : Int = 0
   @Published var searchResults : [MKPlacemark] = []
   @Published var selectedRoute : MKPolyline?
   @Published var selectedAnnotation : MKAnnotation?

   init() {
      addListenerToSearchBar()
   }

   deinit {
      cancellables.forEach { cancellable in
         cancellable.cancel()
      }
   }

   func addListenerToSearchBar() {
      $searchInput.debounce(for: 0.5, scheduler: RunLoop.main).sink { [weak self] string in
         self?.searchResults.removeAll()
         self?.service.fetchSearchPlaces(
            languageQuery: string,
            region: (self?.locationManger?.region)!) { [weak self] placemarks in
            self?.searchResults = placemarks
         }
      }
      .store(in: &cancellables)
   }


   func generatePolyline(placeMark : MKPlacemark) {
    let destination = MKMapItem(placemark: placeMark)
    let destinationAnnotation = MKPointAnnotation()
       destinationAnnotation.coordinate = placeMark.coordinate
      selectedAnnotation = destinationAnnotation
      service.generatePolylineByIndex(destination) { polyline in
         print("DEBUG : \(polyline)")
         self.selectedRoute = polyline
      }
   }
   

   func cancelRouting() {
      selectedIndex = 0
      selectedAnnotation = nil
      selectedRoute = nil
   }

}
