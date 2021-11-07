//
//  ContentView.swift
//  TurtleFinal
//
//  Created by Абдулхаким Магомедов on 03.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
