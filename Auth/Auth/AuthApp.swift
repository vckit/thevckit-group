//
//  AuthApp.swift
//  Auth
//
//  Created by Абдулхаким Магомедов on 18.11.2021.
//

import SwiftUI
import Firebase


@main
struct AuthApp: App {
    init() {
            FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
