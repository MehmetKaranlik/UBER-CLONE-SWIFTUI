//
//  RoutingOverlayView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 6.06.2022.
//

import SwiftUI

struct RoutingOverlayView: View {

   let destinationName : String
   let destinationAdress : String
   let width = UIScreen.main.bounds.width
   let height = UIScreen.main.bounds.height

   let onCancel : () -> ()

    var body: some View {
       VStack {
          DynamicVerticalSpacer(height: 30)

          Text("UBERX")
             .font(.largeTitle)

          DynamicVerticalSpacer(height: 20)

          Group {
             Text(destinationName)
                .padding(.horizontal)
                .font(.title3)
             DynamicVerticalSpacer(height: 10)
             Text(destinationAdress)
                .padding(.horizontal)
                .font(.footnote)
                .foregroundColor(Color(uiColor: .darkGray))
          }.frame(width: width, alignment: .leading)
          Spacer()

          CapsuleButton(function: onCancel,
                        width: width*0.8,
                        height:  50,
                        backgroundColor: .black) {
             // label
             Text("Cancel")
                .foregroundColor(.white)
                .font(.title)
                .bold()
          }
          
          DynamicVerticalSpacer(height: 50)

       }
       .frame(width: width, height: height / 3, alignment: .top)
       .background(.ultraThinMaterial)
       .opacity(0.95)
       .cornerRadius(15, antialiased: true)
    }
}

struct RoutingOverlayView_Previews: PreviewProvider {
    static var previews: some View {
       RoutingOverlayView(destinationName: "GreenWich", destinationAdress: "Üniversite, Fırat Ünv., 23119 Elâzığ Merkez/Elazığ", onCancel: {
          print("123")
       })
          .previewLayout(.sizeThatFits)
    }
}


