//
//  Login.swift
//  Auth
//
//  Created by Абдулхаким Магомедов on 18.11.2021.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct Login: View {
    @State var username = ""
    @State var passowrd = ""
    @State var message = ""
    @State var alert = false
    @State var show = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Sign In")
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
                            TextField("Username", text: $username)
                            
                            if username != "" {
                                Image(systemName: "check.fill")
                                    .foregroundColor(Color.init(.label))
                            }
                        }
                        
                        Divider()
                        
                    }.padding(.bottom, 15)
                    
                    VStack (alignment: .leading) {
                        Text("Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label).opacity(0.75))
                        SecureField("Password", text: $passowrd)
                        
                        Divider()
                        
                    }
                }.padding(.horizontal, 6)
                
                Button(action: {
                    signInWithEmail(email: self.username, password: self.passowrd) { (verified, status) in
                        if !verified {
                            self.message = status
                            self.alert.toggle()
                        }
                        else {
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120)
                        .padding()
                        .background(Color.black)
                        .clipShape(Capsule())
                }
                .padding(.top, 45)
            }
            .padding()
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
            }
            VStack {
                Text("(or)")
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.top, 30)
                
                HStack (spacing: 8) {
                    Text("Don`t Have An Account ?")
                        .foregroundColor(Color.gray.opacity(0.5))
                    Button (action: {
                        self.show.toggle()
                    }) {
                        Text("Sign Up")
                    }
                    .foregroundColor(.blue)
                }
                .padding(.top, 25)
            }.sheet(isPresented: $show){
                SignUp(show: self.$show)
            }
        }
    }
}

//MARK: Method SignIn
func signInWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
    
    Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
        
        if err != nil{
            
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}
//MARK: Method SignUp
func signUpWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
    
    Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
        
        if err != nil{
            
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
