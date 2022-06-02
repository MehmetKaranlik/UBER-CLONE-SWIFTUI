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

      textField.attributedPlaceholder = NSAttributedString(
         string: placeholderText,
         attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
      )
      return textField
   }

   func updateUIView(_ uiView: UITextField, context: Context) {}
}
