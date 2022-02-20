//
//  LoginPage.swift
//  FirebaseApp
//
//  Created by Абдулхаким Магомедов on 19.02.2022.
//

import SwiftUI

struct LoginPage: View {
    
    @StateObject var loginModel: LoginViewModel = LoginViewModel()
    
    @State var useFaceID: Bool = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.5)
                .fill(.black)
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: -90))
                .hLeading()
                .offset(x: -23)
                .padding(.bottom, 30)
            
            Text("Hey! \nLogin now")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                .hLeading()
            
            //MARK: TextField Email
            TextField("Email", text: $loginModel.email)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill (
                            loginModel.email == "" ? Color.black.opacity(0.05) : Color("Orange")
                        )
                }
                .textInputAutocapitalization(.never)
            
            SecureField("Password", text: $loginModel.password)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill (
                            loginModel.password == "" ? Color.black.opacity(0.05) : Color("Orange")
                        )
                }
                .textInputAutocapitalization(.never)
                .padding(.top, 15)
            
            if loginModel.getBioMatricStatus(){
                Group {
                    if loginModel.useFaceID {
                        Button {
                            Task {
                                do {
                                    try await loginModel.authenticateUser()
                                } catch {
                                    loginModel.errorMsg = error
                                        .localizedDescription
                                    loginModel.showError.toggle()
                                }
                            }
                        } label: {
                            VStack (alignment: .leading, spacing: 10) {
                                Label {
                                    Text("Use FaceID to login into previous account")
                                } icon: {
                                    Image(systemName: "faceid")
                                }
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                                Text("Note: Yout can turn of it in settings!")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                        .hLeading()
                    }
                    else {
                        Toggle(isOn: $useFaceID){
                            Text("Use FaceID to Login")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical, 20)
            }
            
            Button {
                Task {
                    do {
                        try await loginModel.loginUser(useFaceID: useFaceID)
                    }
                    catch {
                        loginModel.errorMsg = error.localizedDescription
                        loginModel.showError.toggle()
                    }
                }
            } label: {
                Text("Login")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .hCenter()
                    .background (
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.black)
                    )
            }
            .padding(.vertical, 35)
            .disabled(loginModel.email == "" || loginModel.password == "")
            .opacity(loginModel.email == "" || loginModel.password == "" ? 0.5 : 1)

            NavigationLink {
                
            } label: {
                Text("Skip now")
                    .foregroundColor(.gray)
            }

        }
        .padding(.horizontal, 25)
        .padding(.vertical)
        .alert(loginModel.errorMsg, isPresented: $loginModel.showError) {
            
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

//MARK: Extensions for UI Designing
extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTralling() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
