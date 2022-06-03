
//  CustomTextField.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 19.04.2022.
//

import SwiftUI

struct CustomTextField: View {
   let isObscured: Bool?
   let placeHolderText: String?
   let leftInset: CGFloat?
   let verticalInset: CGFloat?
   let valueHolder: Binding<String>
   let width: CGFloat?
   let height: CGFloat?
   let font : Font
   let backgroundColor: Color?
   let foregroundColor: Color?
   let cornerRadius: CGFloat?
   let textAutoCapitalize: UITextAutocapitalizationType?

   var body: some View {
      if isObscured == nil || isObscured == false {
         TextField(placeHolderText!, text: valueHolder)
            .frame(width: width ?? nil, height: height ?? nil, alignment: .center)
            .foregroundColor(foregroundColor ?? .black)
            .font(font)
            .textFieldStyle(PlainTextFieldStyle())
            .padding(.vertical, 10 + (verticalInset ?? 0))
            .padding(.leading, 10 + (leftInset ?? 0))
            .background(backgroundColor ?? .accentColor)
            .cornerRadius(cornerRadius ?? 0)
            .textInputAutocapitalization(TextInputAutocapitalization(textAutoCapitalize ?? .none))
            .textSelection(.disabled)

      } else {
         SecureField(placeHolderText!, text: valueHolder)
            .frame(width: width ?? nil, height: height ?? nil, alignment: .center)
            .foregroundColor(foregroundColor ?? .black)
            .font(font)
            .textFieldStyle(PlainTextFieldStyle())
            .padding(.vertical, 10 + (verticalInset ?? 0))
            .padding(.leading, 10 + (leftInset ?? 0))
            .background(backgroundColor ?? .accentColor)
            .cornerRadius(cornerRadius ?? 0)
            .textInputAutocapitalization(TextInputAutocapitalization(textAutoCapitalize ?? .none))
            .textSelection(.disabled)
      }
   }
}

struct CustomTextField_Previews: PreviewProvider {
   static var previews: some View {
      CustomTextField(isObscured: false, placeHolderText: "Login", leftInset: 0, verticalInset: 10, valueHolder: .constant("login"), width: nil, height: 1, font: .custom("asd", size: 1), backgroundColor: .red, foregroundColor: .red, cornerRadius: 20, textAutoCapitalize: UITextAutocapitalizationType.none)
         .previewLayout(.sizeThatFits)
         .padding()
   }
}
