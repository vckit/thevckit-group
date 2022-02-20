//
//  LoginView.swift
//  LoginWithGoogleAccount
//
//  Created by Абдулхаким Магомедов on 29.01.2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            // Top image ...
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: getRect().height / 3)
                .padding(.horizontal, 20)
                .offset(y: -10)
            
            // Background circle
                .background {
                    Circle()
                        .fill(Color("LightBlue"))
                        .scaleEffect(2, anchor: .bottom)
                        .offset(y: 20)
                }
            
            VStack (spacing: 20) {
                Text("We currently have over\n740 live roles waiting\ninfor you!")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .kerning(1.1)
                    .foregroundColor(Color.black.opacity(0.8))
                    .multilineTextAlignment(.center)
            }
            .padding()
            .padding(.top, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

// Extending view to get screen boudns...
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
