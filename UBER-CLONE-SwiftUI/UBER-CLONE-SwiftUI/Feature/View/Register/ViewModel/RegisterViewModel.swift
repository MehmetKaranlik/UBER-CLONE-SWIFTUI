//
//  RegisterViewMode.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 4.05.2022.
//

import Foundation

class RegisterViewModel: ObservableObject {

   @Published var isDriver: Int = 0

   @Published var emailValue: String = ""

   @Published var passwordValue: String = ""
   
}
