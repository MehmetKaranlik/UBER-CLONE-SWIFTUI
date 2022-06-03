//
//  SearchBaitView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 3.06.2022.
//

import SwiftUI

struct SearchBaitView: View {
   let onTap: () -> ()

   var body: some View {
      VStack {
         Rectangle()
            .rectangleBeautify()
            .overlay(alignment: .trailing) {
               Image(systemName: "magnifyingglass")
                  .imageBeautify()
            }
            .overlay(alignment: .leading) {
               Text("Search for a location")
                  .textBeautify()
            }
      }
      .onTapGesture {
         onTap()
      }
   }
}

struct SearchBaitViewPreviews: PreviewProvider {
   static var previews: some View {
      SearchBaitView(onTap: {
      })
      .previewLayout(.sizeThatFits)
      .padding()
   }
}

private extension Rectangle {
   func rectangleBeautify() -> some View {
      self
         .frame(width: 250, height: 35, alignment: .top)
         .foregroundColor(.white)
         .cornerRadius(5)
         .shadow(color: .gray.opacity(0.6), radius: 10, x: 10, y: 10)
   }
}

private extension Text {
   func textBeautify() -> some View {
      self
         .padding(.leading, 20)
         .font(.subheadline)
         .foregroundColor(.gray)
   }
}

private extension Image {
   func imageBeautify() -> some View {
      self
         .resizable()
         .scaledToFit()
         .frame(width: 20)
         .padding(.trailing, 5)
         .foregroundColor(.gray)
   }
}
