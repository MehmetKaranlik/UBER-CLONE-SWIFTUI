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

class HomeViewModel : ObservableObject {
   @Published var searchInput : String = ""
   @Published var region = MKCoordinateRegion()
   @Published var mapAnnotations : [MKAnnotation] = []

   init() {
      
   }

}
