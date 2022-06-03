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
   @StateObject var locationManager = LocationManager.shared
   @State var searchBarOpacity : Double = 1
   @State var isOverlayAnimating : Bool = false
   var body: some View {
      ZStack {
         Map(coordinateRegion: $locationManager.region,
             showsUserLocation: true)
            .ignoresSafeArea()
         SearchBaitView(onTap: {
            isOverlayAnimating.toggle()
         })
         .opacity(searchBarOpacity)
         .position(x: UIScreen.main.bounds.maxX / 2, y:60)
         SearchOverlayView(isAnimating: $isOverlayAnimating,
                           searchText: $viewModel.searchInput,
                           searchItems: $viewModel.searchResults) { bool in
            isOverlayAnimating = bool
         }
      }
      .onChange(of: isOverlayAnimating, perform: changeOpacity)
   }
}



struct HomeView_Previews: PreviewProvider {
   static var previews: some View {
      HomeView()
   }
}

// MARK:  helpers
extension HomeView {

   private func changeOpacity<T : Equatable>(value : T)  {
      guard let value = value as? Bool else { return }
      if value {
         withAnimation(.linear(duration: 0.5)) {
            searchBarOpacity = 0
         }
      }else {
         DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
            withAnimation(.linear(duration: 0.5)) {
               searchBarOpacity = 1
            }
         }
      }
   }
}
