//
//  LogInView.swift
//  BasFox
//
//  Created by Абдулхаким Магомедов on 05.11.2021.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var index: Int
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                HStack {
                    VStack (spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .black : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 0 ? Color.black : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    Spacer()
                }
                .padding(.top, 30)
                
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.black)
                        TextField("Email", text: self.$email)
                    }
                    Divider()
                        .background(Color.black.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack {
                    HStack (spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        SecureField("Password", text: self.$password)
                    }
                    Divider()
                        .background(Color.black.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Text("Forget Password?")
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color.white)
            .clipShape(CShapeFirst())
            .contentShape(CShapeFirst())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}
