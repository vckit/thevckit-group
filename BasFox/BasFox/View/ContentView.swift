//
//  ContentView.swift
//  BasFox
//
//  Created by Абдулхаким Магомедов on 05.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var index = 0
    var body: some View {
        GeometryReader { _ in
            VStack {
                Image("applelogo")
                    .resizable()
                    .frame(width: 70, height: 70)
                ZStack {
                    SignUpView(index: self.$index)
                        .zIndex(Double(self.index))
                    LogInView(index: self.$index)
                }
                HStack (spacing: 15) {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                    Text("Swift")
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                HStack (spacing: 25) {
                    Button(action: {
                        
                    }) {
                        Image("applelogo")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        
                    }) {
                        Image("facebook")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        
                    }) {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
