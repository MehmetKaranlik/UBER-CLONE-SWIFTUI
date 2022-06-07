//
//  DB_Referances.swift
//  UBER-CLONE-SwiftUI
//
//  Created by mehmet karanlık on 5.06.2022.
//

import Foundation
import FirebaseDatabase

let DB_REF = Database.database()
let USER_DB_REF = DB_REF.reference(withPath: "USERS")
let DRIVER_LOCATIONS_REF = DB_REF.reference(withPath: "DRIVER_LOCATIONS")
