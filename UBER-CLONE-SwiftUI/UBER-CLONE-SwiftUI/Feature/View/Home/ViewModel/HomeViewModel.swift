//
//  HomeViewModel.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 2.06.2022.
//

import Combine
import Foundation
import MapKit
import SwiftUI

class HomeViewModel: ObservableObject {
   // MARK: properties

   var cancellables = Set<AnyCancellable>()
   let service = HomeService()
   weak var locationManger = LocationManager.shared

   // published properties
   @Published var searchInput: String = ""
   @Published var region = MKCoordinateRegion()
   @Published var mapAnnotations: [DriverAnnotation] = []
   @Published var selectedIndex: Int = 0
   @Published var searchResults: [MKPlacemark] = []
   @Published var selectedRoute: MKPolyline?
   @Published var selectedAnnotation: MKAnnotation?

   init() {
      addListenerToSearchBar()
      fetchDrivers()
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
            region: (self?.locationManger?.region)!
         ) { [weak self] placemarks in
            self?.searchResults = placemarks
         }
      }
      .store(in: &cancellables)
   }

   func generatePolyline(placeMark: MKPlacemark) {
      let destination = MKMapItem(placemark: placeMark)
      let destinationAnnotation = MKPointAnnotation()
      destinationAnnotation.coordinate = placeMark.coordinate
      selectedAnnotation = destinationAnnotation
      service.generatePolylineByIndex(destination) { polyline in
         self.selectedRoute = polyline
      }
   }

   func cancelRouting() {
      selectedIndex = 0
      selectedAnnotation = nil
      selectedRoute = nil
   }



   func fetchDrivers() {
      locationManger?
         .$location
         .eraseToAnyPublisher()
         .tryMap{ $0 as CLLocation}
         .sink(receiveCompletion: handleCompletion,
               receiveValue: { [unowned self] location in
            self.service.fetchDrivers(location: location) { [unowned self] annotation in
               self.configureByIsAlreadyAdded(annotation)
            }
         }
      )
         .store(in: &cancellables)
   }


   fileprivate func configureByIsAlreadyAdded(_ annotation: DriverAnnotation) {
      if let index = self.mapAnnotations
         .firstIndex(where: { anno in  anno.uid == annotation.uid  }) {
         self.mapAnnotations[index].updateLocation(withCoordinate: annotation.coordinate)
      }else {
         self.mapAnnotations.append(annotation)
      }
   }

   func handleCompletion(completion: Subscribers.Completion<Error>) {
      switch completion {
         case.finished:
            break
         case .failure(_):
            break
      }
   }
}
