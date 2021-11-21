//
//  BlogAppApp.swift
//  BlogApp
//
//  Created by Абдулхаким Магомедов on 21.11.2021.
//

import SwiftUI
import Firebase

@main
struct BlogAppApp: App {
    // Инициализируем Firebase
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
