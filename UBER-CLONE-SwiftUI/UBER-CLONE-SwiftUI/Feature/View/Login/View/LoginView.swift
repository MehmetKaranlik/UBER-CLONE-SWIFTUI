//
//  LoginView.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 19.04.2022.
//

import SwiftUI

struct LoginView: View {
   // MARK: properties

   @StateObject var viewModel = LoginViewModel()

   @State var userName  : String = ""
   @State var password : String = ""
   // MARK: body

   
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
               buildDontHaveAccountButton()
               DynamicVerticalSpacer(height: 20)
               NavigationLink(isActive: $viewModel.isLeavingScene) {
                  HomeView()
                     .navigationBarHidden(true)
               } label: {
                  
               }

            }
            .disabled(viewModel.isLoading)

            if viewModel.isLoading {
               LoadingView(isAnimating: viewModel.isLoading)
            }
         }
         .navigationBarHidden(true)
      }
   }


   fileprivate func buildDontHaveAccountButton() -> some View {
      return NavigationLink {
         RegisterView()
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
      } label: {
         HStack(spacing: 5) {
            Text("Dont have account ?")
               .foregroundColor(.white)
            Text("Click here to create.")
               .foregroundColor(.accentColor)
         }
         .font(.footnote)
      }
      .buttonStyle(TextButtonStyle())
   }

   fileprivate func buildLoginButton() -> some View {
      return CapsuleButton(
         function: {
            viewModel.login(email: userName, password: password)
      }, width: 300, height: 35, backgroundColor: .accentColor) {
         Text("Login")
            .foregroundColor(.white)
            .bold()
            .tracking(1)
      }
   }

   fileprivate func buildEmailTextField() -> some View {
      return ImagedTextFieldRow(imageName: ImageConstants.shared.accountIcon) {
         CustomUITextField(
            valueholder: $userName,
            placeholderText: "E-mail",
            placeholderColor: .lightGray,
            fontColor: .lightGray,
            font: .preferredFont(forTextStyle: .body),
            autoCapitalization: UITextAutocapitalizationType.none,
            autoCorrectionType: .no,
            isObscured: false
         )
      }
   }

   fileprivate func buildPasswordTextField() -> some View {
      return ImagedTextFieldRow(imageName: ImageConstants.shared.lockIcon) {
         CustomUITextField(
            valueholder: $password,
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
