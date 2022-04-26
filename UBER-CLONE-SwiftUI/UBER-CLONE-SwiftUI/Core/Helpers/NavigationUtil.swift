//
//  NavigationUtil.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 26.04.2022.
//

import Foundation
import UIKit
import SwiftUI


struct NavigationUtil {

 static func popToRootView() {
  findNavigationController(viewController: UIApplication
   .shared.windows
   .filter { $0.isKeyWindow }.first?.rootViewController)?
   .popToRootViewController(animated: true)
 }


 static func replaceRootView<T:View>(_ view : T ) {
  let vc = UIHostingController(rootView: NavigationView(content: {  view }))
  UIApplication.shared.windows.first?.rootViewController = vc
 }

 static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
  guard let viewController = viewController else { return nil }
  if let navigationController = viewController as? UINavigationController { return navigationController }

  for childViewController in viewController.children {
   return findNavigationController(viewController: childViewController)
  }
  return nil
 }
}
