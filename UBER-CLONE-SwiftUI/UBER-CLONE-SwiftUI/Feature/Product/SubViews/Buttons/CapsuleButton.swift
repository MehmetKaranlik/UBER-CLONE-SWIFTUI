//
//  CapsuleButton.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 26.04.2022.
//

import SwiftUI

struct CapsuleButton<T:View>: View {
 let function : () -> Void
 let width : CGFloat
 let height: CGFloat
 let backgroundColor: Color
 @ViewBuilder let label: T
    var body: some View {
     Button {
      function()
     } label: {
      Capsule(style: .continuous)
       .capsuleModifier(width: width, height: height, backgroundColor: backgroundColor, content: label)
     }

    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
     CapsuleButton(function: {
      print("123")
     }, width: 250, height: 30, backgroundColor: .accentColor,label: {
      Text("Placeholder")
       .foregroundColor(.white)
     })
      .previewLayout(.sizeThatFits)
      .padding()
      .background(.black)
    }
}


extension Capsule {
 fileprivate func capsuleModifier<T:View>(width:CGFloat,height:CGFloat,backgroundColor:Color,content:T) -> some View {
  self
   .frame(width: width, height: height, alignment: .center)
   .foregroundColor(backgroundColor)
   .overlay(alignment: .center) {
    content
   }
 }
}
