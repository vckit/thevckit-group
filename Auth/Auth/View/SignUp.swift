//
//  SignUp.swift
//  Auth
//
//  Created by Абдулхаким Магомедов on 18.11.2021.
//

import SwiftUI

struct SignUp: View {
    @State var username = ""
    @State var password = ""
    @State var message = ""
    @State var alert = false
    @Binding var show: Bool
    var body: some View {
        VStack {
            Text("Sign Up")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding([.top, .bottom], 20)
            
            VStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    Text("Username")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label).opacity(0.75))
                    
                    HStack {
                        TextField("Enter your username", text: $username)
                        if username != "" {
                            Image(systemName: "check")
                                .foregroundColor(Color.init(.label))
                        }
                    }
                    Divider()
                    
                }.padding(.bottom, 15)
                
                VStack (alignment: .leading) {
                    Text("Password")
                        .fontWeight(.light)
                        .font(.headline)
                        .foregroundColor(Color.init(.label).opacity(0.75))
                    SecureField("Enter your password", text: $password)
                    Divider()
                }
            }.padding(.horizontal, 6)
            
            Button(action: {
                signUpWithEmail(email: self.username, password: self.password) { (verified, status) in
                    if !verified {
                        self.message = status
                        self.alert.toggle()
                    } else {
                        UserDefaults.standard.set(true, forKey: "status")
                        self.show.toggle()
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }
                }
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
                    .background(Color.black)
                    .clipShape(Capsule())
            }.padding(.top, 45)
        }.padding()
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
            }
    }
}


