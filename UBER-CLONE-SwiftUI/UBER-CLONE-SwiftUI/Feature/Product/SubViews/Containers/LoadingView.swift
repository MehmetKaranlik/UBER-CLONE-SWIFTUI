//
//  LoadingView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import SwiftUI

struct LoadingView: View {
   @State var isAnimating : Bool
    var body: some View {
      Rectangle()
          .frame(width: 200, height: 200, alignment: .center)
          .opacity(0.5)
          .background(.ultraThinMaterial)
          .blur(radius:0.3,opaque: false)
          .cornerRadius(15)
          .overlay(alignment: .center) {
             ActivityIndicatorView(isAnimating: $isAnimating,
                                   style: .medium,
                                   color: .black)
          }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isAnimating: true)

    }
}
