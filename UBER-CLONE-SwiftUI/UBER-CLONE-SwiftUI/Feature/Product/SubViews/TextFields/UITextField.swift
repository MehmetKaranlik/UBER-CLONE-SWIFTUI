//
//  UITextField.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 26.04.2022.
//

import Foundation
import SwiftUI
import UIKit

struct CustomUITextField: UIViewRepresentable {

   @Binding var valueholder : String

   let placeholderText: String
   let placeholderColor: UIColor
   let fontColor: UIColor
   let font: UIFont?
   let autoCapitalization: UITextAutocapitalizationType?
   let autoCorrectionType: UITextAutocorrectionType?
   let isObscured: Bool?

   func makeUIView(context: Context) -> UITextField {
      let textField = UITextField()
      textField.textColor = fontColor
      textField.font = font
      let leftView = UIView()
      leftView.widthAnchor.constraint(equalToConstant: 20).isActive = true
      textField.leftView = leftView
      textField.autocapitalizationType = autoCapitalization!
      textField.autocorrectionType = autoCorrectionType!
      textField.isSecureTextEntry = isObscured!
      textField.delegate = context.coordinator

      textField.attributedPlaceholder = NSAttributedString(
         string: placeholderText,
         attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
      )
      return textField
   }

   func updateUIView(_ uiView: UITextField, context: Context) {

   }

   func makeCoordinator() -> Coordinator {
      return Coordinator($valueholder)
   }

   class Coordinator : NSObject, UITextFieldDelegate {
      @Binding var valueholder : String

      init(_ text : Binding<String>) {
         self._valueholder = text
      }


   func textFieldDidChangeSelection(_ textField: UITextField) {
         valueholder = textField.text ?? ""
      }
   }
   
}
