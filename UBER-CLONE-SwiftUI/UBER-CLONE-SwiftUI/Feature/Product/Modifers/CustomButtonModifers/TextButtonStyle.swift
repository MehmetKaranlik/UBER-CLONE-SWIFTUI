//
//  TextButtonStyle.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 27.04.2022.
//

import Foundation
import SwiftUI


struct TextButtonStyle : ButtonStyle {
 func makeBody(configuration: Configuration) -> some View {
  configuration.label
   .opacity(configuration.isPressed ? 0.9 : 1)
   .scaleEffect(configuration.isPressed ? 0.95 : 1)
   .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
 }
}
