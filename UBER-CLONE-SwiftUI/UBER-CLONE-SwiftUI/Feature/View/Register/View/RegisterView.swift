//
//  RegisterView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 27.04.2022.
//

import SwiftUI

struct RegisterView: View {
   // MARK: properties

   @StateObject var viewModel = RegisterViewModel()
   @State var emailValue: String = ""
   @State var passwordValue: String = ""
   @State var userType : Int = 0

   // MARK: body

   var body: some View {
      ZStack {
         Color.black.ignoresSafeArea()
         VStack {
            buildHeader()
            buildTextFields()
            DynamicVerticalSpacer(height: 20)
            buildSegmentedController()
            DynamicVerticalSpacer(height: 20)
            buildRegisterButton()
            Spacer()
            buildHaveAccountButton()
            DynamicVerticalSpacer(height: 20)
            NavigationLink(isActive: $viewModel.isNavigating) {
               HomeView()
                  .navigationBarHidden(true)
            } label: {

            }

         }
         if viewModel.isLoading { LoadingView(isAnimating: viewModel.isLoading) }
      }
   }
}

// MARK: preview

struct RegisterView_Previews: PreviewProvider {
   static var previews: some View {
      RegisterView()
   }
}

// MARK: extracted views

private extension RegisterView {
   func buildHaveAccountButton() -> some View {
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

   func buildTextFields() -> some View {
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
               valueholder: $passwordValue,
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

   func buildSegmentedController() -> some View {
      return VStack(alignment: .leading) {
         Text("User role")
            .foregroundColor(Color(uiColor: .lightGray))
            .font(.body)
            .bold()
         SegmentedController {
            Text("Rider")
         } _: {
            Text("Driver")
         } onChanged: { index in
            viewModel.isDriver = index
         }
      }
      .padding(.horizontal, 40)
   }

   func buildHeader() -> Text {
      return Text("Register")
         .foregroundColor(Color(uiColor: .lightGray))
         .font(.largeTitle)
   }

   func buildRegisterButton() -> CapsuleButton<Text> {
      return CapsuleButton(
         function: {
            viewModel.registerUser(email: emailValue,
                                   password: passwordValue)
         }, width: 300,
         height: 35,
         backgroundColor: .blue
      ) {
         Text("Register")
            .foregroundColor(.white)
            .bold()
            .tracking(1)
      }
   }
}
