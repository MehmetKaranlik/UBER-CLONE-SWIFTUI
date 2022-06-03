//
//  SearchOverlayView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 3.06.2022.
//

import SwiftUI
import MapKit

struct SearchOverlayView: View {
   // MARK: properties

   let width = UIScreen.main.bounds.width
   let height = UIScreen.main.bounds.height
   @Binding var isAnimating: Bool
   // animation values
   @State var upperSidePosition = -(UIScreen.main.bounds.height / 5)
   @State var bottomSidePosition = ((4*UIScreen.main.bounds.height) / 3)
   @Binding var searchText : String
   @Binding var searchItems : [MKPlacemark]
   let onClose : (Bool) -> ()

   var body: some View {
      VStack(spacing: 0) {
         buildUpperContainer()
         buildBottomContainer()
      }
      .frame(width: width, height: height, alignment: .center)
      .onChange(of: isAnimating, perform: { newValue in
         if newValue {
            withAnimation(.easeOut(duration: 0.5)) {
               upperSidePosition = height / 10
            }
            withAnimation(.easeOut(duration: 0.75)) {
               bottomSidePosition = height / 10
            }
         } else {
            withAnimation(.easeOut(duration: 0.5)) {
               upperSidePosition = -height / 5
            }
            withAnimation(.easeOut(duration: 0.75)) {
               bottomSidePosition = 4*height / 3
            }
         }
      })
      .ignoresSafeArea()
   }

   // MARK: extracted methodsd

   fileprivate func buildUpperContainer() -> some View {
      return HStack(spacing: 0) {
         buildLeftObjects()

         buildTextFields()
      }
      .background(.white)

      .frame(width: width, height: height / 5, alignment: .center)
      .position(x: width / 2, y: upperSidePosition)
   }

   fileprivate func buildLeftObjects() -> some View {
      return VStack {
         DynamicVerticalSpacer(height: 15)
         Button {
            isAnimating.toggle()
            onClose(isAnimating)
         } label: {
            Image(systemName: "xmark")
               .imageBeatufiy()
         }
         DynamicVerticalSpacer(height: 15)
         Circle()
            .frame(width: 5, height: 5, alignment: .center)
            .foregroundColor(Color(uiColor: .darkGray))
         Rectangle()
            .frame(width: 1, height: 25, alignment: .center)
            .foregroundColor(Color(uiColor: .lightGray))
         Circle()
            .frame(width: 3, height: 3, alignment: .center)
            .foregroundColor(Color(uiColor: .lightGray))
      }
      .frame(width: width / 6, height: height / 5)
   }

   fileprivate func buildTextFields() -> some View {
      return VStack(alignment: .leading) {
         Spacer()
         DynamicVerticalSpacer(height: 35)
         CustomTextField(isObscured: false, placeHolderText: "Current Location",
                         leftInset: 5, verticalInset: 0, valueHolder: .constant(""),
                         width: 250, height: 10, font: .callout,
                         backgroundColor: Color(uiColor: .lightGray),
                         foregroundColor: .gray, cornerRadius: 3,
                         textAutoCapitalize: UITextAutocapitalizationType.none)
            .padding(.leading, 20)
            .disabled(true)
         DynamicVerticalSpacer(height: 10)

         CustomTextField(isObscured: false, placeHolderText: "Search Location",
                         leftInset: 5, verticalInset: 0, valueHolder: $searchText,
                         width: 250, height: 10, font: .callout,
                         backgroundColor: Color(uiColor: .systemGroupedBackground),
                         foregroundColor: .black, cornerRadius: 3,
                         textAutoCapitalize: UITextAutocapitalizationType.none)
            .padding(.leading, 20)
         Spacer()
      }
      .frame(width: 5*width / 6, height: height / 5, alignment: .leading)
   }

   fileprivate func buildBottomContainer() -> some View {
      return HStack {
         List {
            Section {
               ForEach($searchItems, id: \.self) { $item  in
                  VStack(alignment: .leading) {
                     Text(item.name ?? "")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                     Text(item.title ?? "")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .truncationMode(.tail)
                        .lineLimit(1)
                  }
               }
            } header: {
               Text("Locations")
                  .font(.title2)
                  .fontWeight(.bold)
                  .foregroundColor(Color(uiColor: .darkGray))
                  .padding(.vertical,10)
            }
         }
         .listRowInsets(.none)
         .listStyle(.plain)


   }


      .frame(width: width, height: 4*height / 5, alignment: .center)
      .border(Color(uiColor: .lightGray), width: 0.5)

      .background(.white)
      .position(x: width / 2, y: bottomSidePosition)
   }
}

// MARK: previews

struct SearchOverlayView_Previews: PreviewProvider {
   static var previews: some View {
      SearchOverlayView(isAnimating: .constant(true),searchText: .constant("hi"),searchItems: .constant([])) { bool in
         
      }
   }
}

private extension Image {
   func imageBeatufiy() -> some View {
      resizable()
         .scaledToFit()
         .frame(width: 15)
         .foregroundColor(.black)
   }
}
