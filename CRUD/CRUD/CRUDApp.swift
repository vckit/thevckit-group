//
//  CRUDApp.swift
//  CRUD
//
//  Created by Абдулхаким Магомедов on 09.12.2021.
//

import SwiftUI
import Firebase

@main
struct CRUDApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
