 //
 //  ImagedTextFieldRow.swift
 //  UBER-CLONE-SwiftUI
 //
 //  Created by mehmet karanlık on 26.04.2022.
 //

import SwiftUI

struct ImagedTextFieldRow<T: View>: View {
 let imageName : String
 @ViewBuilder  let uiTextField: T

 var body: some View {
  HStack {
   Image(imageName)
    .imageModifier()

   uiTextField
   .frame(width: 250, height: 30, alignment: .center)
  }
  .hstackModifier()
 }
}

struct ImagedTextFieldRow_Previews: PreviewProvider {
 static var previews: some View {
  ImagedTextFieldRow(imageName: ImageConstants.shared.personOutlineIcon, uiTextField: {
   CustomUITextField(placeholderText: "", placeholderColor: .red, fontColor: .red, font: .preferredFont(forTextStyle: .body), autoCapitalization: UITextAutocapitalizationType.none, autoCorrectionType: .no, isObscured: false)
  })
   .previewLayout(.sizeThatFits)
   .padding()
   .background(.black)
 }
}

extension Image {
 fileprivate func imageModifier() -> some View {
  self

   .resizable()
   .renderingMode(.template)
   .foregroundColor(.gray)
   .frame(width: 28, height: 28, alignment: .center)

 }
}

extension HStack {
 fileprivate func hstackModifier() -> some View {
  self
   .padding(.horizontal,10)
   .padding(.vertical,5)
   .background(Color(uiColor: .lightGray),in:RoundedRectangle(cornerRadius: 5,style: .continuous).stroke(lineWidth: 0.5))
 }
}
