//
//  LoginViewModelTesting.swift
//  UBER-CLONE-SwiftUITests
//
//  Created by mehmet karanlık on 8.06.2022.
//

import XCTest
import Firebase
@testable import UBER_CLONE_SwiftUI

class LoginViewModelTesting: XCTestCase {
   var viewModel : LoginViewModel!
   var testEmail : String!
   var testPassowrd : String!


    override func setUpWithError() throws {
       viewModel = LoginViewModel()
       testEmail = "mhmtkrnlk@gmail.com"
       testPassowrd = "123123"
    }

    override func tearDownWithError() throws {
    }

   func testValueAssertion()  {
      XCTAssertNotNil(viewModel.service)
      XCTAssertFalse(viewModel.isLoading)
      XCTAssertFalse(viewModel.isLeavingScene)
   }

   func testLogin() {
      viewModel.login(email:testEmail, password: testPassowrd)
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
         XCTAssertTrue(self.viewModel.isLeavingScene)
      }
   }

}
