//
//  RegisterView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 27.04.2022.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = RegisterViewModel()
   @State var emailValue: String = ""
   @State var passwordValue: String = ""
   var body: some View {
      ZStack {
         Color.black.ignoresSafeArea()
         VStack {
            buildHeader()
            buildTextFields()
            DynamicVerticalSpacer(height: 20)
            buildSegmentedController()
            DynamicVerticalSpacer(height: 20)
            CapsuleButton(function: {}, width: 300, height: 35, backgroundColor: .blue) {
               Text("Register")
                  .foregroundColor(.white)
                  .bold()
                  .tracking(1)
            }
            Spacer()
            buildHaveAccountButton()
            DynamicVerticalSpacer(height: 20)
         }
      }
   }

   fileprivate func buildHaveAccountButton() -> some View {
      return Button {
         NavigationUtil.popToRootView()
      } label: {
         HStack(spacing: 5) {
            Text("Have an account ?")
               .foregroundColor(.white)
            Text("Click here to login.")
               .foregroundColor(.blue)
         }
         .font(.footnote)
      }
      .buttonStyle(TextButtonStyle())
   }

   fileprivate func buildTextFields() -> some View {
      return Group {
         ImagedTextFieldRow(imageName: ImageConstants.shared.accountIcon) {
            CustomUITextField(
               valueholder: $emailValue,
               placeholderText: "E-mail",
               placeholderColor: .lightGray,
               fontColor: .lightGray,
               font: .preferredFont(forTextStyle: .body),
               autoCapitalization: UITextAutocapitalizationType.none,
               autoCorrectionType: .no,
               isObscured: false
            )
         }
         DynamicVerticalSpacer(height: 20)
         ImagedTextFieldRow(imageName: ImageConstants.shared.lockIcon) {
            CustomUITextField(
               valueholder : $passwordValue,
               placeholderText: "Password",
               placeholderColor: .lightGray,
               fontColor: .lightGray,
               font: .preferredFont(forTextStyle: .body),
               autoCapitalization: UITextAutocapitalizationType.none,
               autoCorrectionType: .no,
               isObscured: true
            )
         }
      }
   }

   fileprivate func buildSegmentedController() -> some View {
      return VStack(alignment: .leading) {
         Text("User role")
            .foregroundColor(Color(uiColor: .lightGray))
            .font(.body)
            .bold()
         SegmentedController {
            Text("Rider")
         } _: {
            Text("Driver")
         } onChanged: { _ in
         }
      }
      .padding(.horizontal, 40)
   }

   fileprivate func buildHeader() -> Text {
      return Text("Register")
         .foregroundColor(Color(uiColor: .lightGray))
         .font(.largeTitle)
   }
}

struct RegisterView_Previews: PreviewProvider {
   static var previews: some View {
      RegisterView()
   }
}
