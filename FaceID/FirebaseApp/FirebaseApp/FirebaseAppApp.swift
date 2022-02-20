//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by Абдулхаким Магомедов on 19.02.2022.
//

import SwiftUI
import Firebase

@main
struct FirebaseAppApp: App {
    //MARK: Initialization Firebase
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
