//
//  DynamicVerticalSpacer.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 26.04.2022.
//

import SwiftUI

struct DynamicVerticalSpacer: View {
 let height: CGFloat
    var body: some View {
     Spacer()
      .frame(width: 0, height: height, alignment: .center)
    }
}

struct DynamicVerticalSpacer_Previews: PreviewProvider {
    static var previews: some View {
        DynamicVerticalSpacer(height: 20)
    }
}
