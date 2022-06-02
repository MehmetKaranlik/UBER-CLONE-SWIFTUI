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

 static var connectedScenes: [UIWindowScene] {
   get {
    return  UIApplication.shared.connectedScenes.filter({ $0.activationState == .foregroundActive }).compactMap({$0 as? UIWindowScene})
   }
 }

 static func popToRootView() {
  lazy var vc = connectedScenes.first?.windows.filter { $0.isKeyWindow}.first?.rootViewController
  findNavigationController(viewController: vc)?
   .popToRootViewController(animated: true)
 }

 static func replaceRootView<T:View>(_ view : T ) {
  let vc = UIHostingController(rootView: NavigationView(content: {  view }))
  connectedScenes.first?.windows.first?.rootViewController = vc
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
