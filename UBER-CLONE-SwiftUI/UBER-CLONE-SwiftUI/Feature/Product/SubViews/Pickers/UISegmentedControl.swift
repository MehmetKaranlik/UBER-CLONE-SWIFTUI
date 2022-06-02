//
//  UISegmentedControl.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 4.05.2022.
//

import Foundation
import SwiftUI

struct SegmentedController<Content: View>: View {
   let firstContent: Content
   let secondContent: Content
   @State var selectedIndex = 0
   let onChange: (Int) -> Void

   init(_ firstContent: @escaping () -> Content,
        _ secondContent: @escaping () -> Content,
        onChanged: @escaping (Int) -> Void)
   {
      UISegmentedControl.appearance().selectedSegmentTintColor = .lightGray
      UISegmentedControl.appearance().backgroundColor = .darkGray.withAlphaComponent(0.7)
      UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
      UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)

      self.firstContent = firstContent()
      self.secondContent = secondContent()
      self.onChange = onChanged
   }

   var body: some View {
      Picker(selection: $selectedIndex) {
         firstContent.tag(0)
         secondContent.tag(1)
      } label: {}
         .onChange(of: selectedIndex, perform: { newValue in
            onChange(newValue)
         })
         .pickerStyle(.segmented)
   }
}

struct SegmentedController_Previews: PreviewProvider {
   static var previews: some View {
      SegmentedController {
         Text("A")
      } _: {
         Text("B")
      } onChanged: { _ in
      }
   }
}
