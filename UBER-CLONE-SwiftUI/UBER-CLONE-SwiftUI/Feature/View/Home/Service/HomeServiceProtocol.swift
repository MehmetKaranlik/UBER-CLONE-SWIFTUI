//
//  HomeServiceProtocol.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 3.06.2022.
//

import Foundation
import MapKit
protocol HomeServiceProtocol {
   typealias Completion =  ([MKPlacemark]) -> ()
   typealias PolylineCompletion = (MKPolyline) -> ()
   func  fetchSearchPlaces(languageQuery : String,region : MKCoordinateRegion, completion : @escaping Completion)
   func  generatePolylineByIndex(_ toDestination : MKMapItem, completion : @escaping PolylineCompletion)
}
