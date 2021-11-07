//
//  Home.swift
//  ScrollableApp
//
//  Created by Абдулхаким Магомедов on 06.11.2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("Historical Letters")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .padding(.top, 25)
                .padding(.bottom, 30)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack (spacing: 30) {
                    ForEach(letters) { letter in
                        LetterCardView(letter: letter)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .coordinateSpace(name: "SCROLL")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background (
            Color("BG")
                .ignoresSafeArea(.all)
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
