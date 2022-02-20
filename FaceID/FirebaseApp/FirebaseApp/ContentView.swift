//
//  ContentView.swift
//  FirebaseApp
//
//  Created by Абдулхаким Магомедов on 19.02.2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
        NavigationView{
            if logStatus {
                Home()
            }
            else {
                LoginPage()
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
