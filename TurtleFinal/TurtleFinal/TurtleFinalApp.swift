//
//  TurtleFinalApp.swift
//  TurtleFinal
//
//  Created by Абдулхаким Магомедов on 03.11.2021.
//

import SwiftUI

@main
struct TurtleFinalApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
