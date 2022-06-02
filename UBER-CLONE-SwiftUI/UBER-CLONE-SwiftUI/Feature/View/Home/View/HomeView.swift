//
//  HomeView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 2.06.2022.
//

import MapKit
import SwiftUI

struct HomeView: View {
  @StateObject var viewModel = HomeViewModel()
   var body: some View {
      Map(coordinateRegion:   $viewModel.locationManager.region)
      .ignoresSafeArea()
      .onAppear {
       
      }
   }
}

struct HomeView_Previews: PreviewProvider {
   static var previews: some View {
      HomeView()
   }
}
