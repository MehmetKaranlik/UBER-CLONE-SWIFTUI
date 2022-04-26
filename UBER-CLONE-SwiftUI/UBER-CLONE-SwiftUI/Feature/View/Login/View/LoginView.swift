 //
 //  LoginView.swift
 //  UBER-CLONE-SwiftUI
 //
 //  Created by mehmet karanlık on 19.04.2022.
 //

import SwiftUI

struct LoginView: View {
  // MARK:  properties
 @ObservedObject var vm : LoginViewModel = LoginViewModel()

  // MARK:  body
 var body: some View {


  NavigationView {
   ZStack {
    Color.black.ignoresSafeArea()
    VStack {
     buildHeader()
     buildEmailTextField()
     DynamicVerticalSpacer(height: 15)
     buildPasswordTextField()
     DynamicVerticalSpacer(height: 30)
     buildLoginButton()
     Spacer()
    }
   }
   .navigationBarHidden(true)
  }
 }




 fileprivate func buildLoginButton() -> CapsuleButton<Text> {
  return CapsuleButton(function: {
   debugPrint("123")
  }, width: 300, height: 30, backgroundColor: .accentColor) {
   Text("Login")
    .foregroundColor(.white)
  }
 }


 fileprivate func buildEmailTextField() -> ImagedTextFieldRow<CustomUITextField> {
  return ImagedTextFieldRow(imageName: ImageConstants.shared.accountIcon) {
   CustomUITextField(placeholderText: "E-mail", placeholderColor: .lightGray, fontColor: .lightGray, font: .preferredFont(forTextStyle: .body), autoCapitalization: UITextAutocapitalizationType.none, autoCorrectionType: .no, isObscured: false)
  }
 }

 fileprivate func buildPasswordTextField() -> ImagedTextFieldRow<CustomUITextField> {
  return ImagedTextFieldRow(imageName: ImageConstants.shared.lockIcon) {
   CustomUITextField(placeholderText: "Password", placeholderColor: .lightGray, fontColor: .lightGray, font: .preferredFont(forTextStyle: .body), autoCapitalization: UITextAutocapitalizationType.none, autoCorrectionType: .no, isObscured: true)
  }
 }

 fileprivate func buildHeader() -> Text {
  return Text("UBER")
   .foregroundColor(Color(uiColor: .lightGray))
   .font(.largeTitle)
 }
}

struct LoginView_Previews: PreviewProvider {
 static var previews: some View {
  LoginView()
 }
}







