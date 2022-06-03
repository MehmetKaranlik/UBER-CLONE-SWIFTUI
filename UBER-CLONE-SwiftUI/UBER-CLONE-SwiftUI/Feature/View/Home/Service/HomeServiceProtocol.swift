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

   func  fetchSearchPlaces(languageQuery : String,region : MKCoordinateRegion, completion : @escaping Completion)

}
