//
//  LoginServiceTest.swift
//  UBER-CLONE-SwiftUITests
//
//  Created by mehmet karanlık on 8.06.2022.
//

import XCTest
import FirebaseAuth
@testable import UBER_CLONE_SwiftUI
class LoginServiceTest: XCTestCase {
   var service : LoginService!
   var testEmail : String!
   var testPassword : String!

    override func setUpWithError() throws {
       service = LoginService()
       testEmail = "mhmtkrnlk@gmail.com"
       testPassword = "123123"
    }

    override func tearDownWithError() throws {

    }

   func testLogin() {
      service.login(email: testEmail, password: testPassword) { result, error in
         XCTAssert(error == nil)
         XCTAssert(result != nil)
         XCTAssert(!result!.user.uid.isEmpty)
      }
   }

   func typeAssertion() {
      XCTAssert(service.auth.isKind(of: FirebaseAuth.Auth.self))
   }
}
