//
//  UBER_CLONE_SwiftUIApp.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 19.04.2022.
//

import SwiftUI
import Firebase
@main
struct UBER_CLONE_SwiftUIApp: App {
   init() {
      FirebaseApp.configure()
   }
    var body: some Scene {
        WindowGroup {
           LoginView()
        }
    }
}
