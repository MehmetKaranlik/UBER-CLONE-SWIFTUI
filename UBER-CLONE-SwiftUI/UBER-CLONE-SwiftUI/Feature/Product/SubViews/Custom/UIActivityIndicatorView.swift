//
//  UIActivityIndicatorView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import SwiftUI




struct ActivityIndicatorView : UIViewRepresentable {

   @Binding var isAnimating : Bool
   let style : UIActivityIndicatorView.Style
   let color : UIColor

   func makeUIView(context: Context) -> UIActivityIndicatorView {
      let av = UIActivityIndicatorView()
      av.hidesWhenStopped = true
      av.color = color
      av.style = style

      return av
   }

   func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
      if isAnimating && !uiView.isAnimating{
         uiView.startAnimating()
      }else if !isAnimating && uiView.isAnimating {
         uiView.stopAnimating()
      }
   }
}
