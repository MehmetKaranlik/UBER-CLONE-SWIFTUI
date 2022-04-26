//
//  ImageConstants.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 26.04.2022.
//

import Foundation


struct ImageConstants {

 static let shared : ImageConstants = ImageConstants()

 private init () {}

 var appIcon : String  {
  get { toImage(value: "appIcon")}
 }

 var backButtonIcon : String {
  get { toImage(value: "baseline_arrow_back_black_36dp")}
 }

 var xIcon: String {
  get { toImage(value: "baseline_clear_white_36pt_2x")}
 }

 var sandwichMenuButtonIcon: String {
  get { toImage(value: "baseline_menu_black_36dp")}
 }

 var chevronIcon: String {
  get { toImage(value: "chevron-sign-to-right")}
 }

 var accountIcon: String {
  get { toImage(value: "ic_account_box_white_2x")}
 }
 var lockIcon: String {
  get { toImage(value: "ic_lock_outline_white_2x")}
 }
 var mailIcon: String {
  get { toImage(value: "ic_mail_outline_white_2x")}
 }

 var personOutlineIcon: String{
  get {toImage(value: "ic_person_outline_white_2x")}
 }

 

 private  func toImage(value : String ) -> String {
  return value
 }


}
