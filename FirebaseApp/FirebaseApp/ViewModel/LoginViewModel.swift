//
//  LoginViewModel.swift
//  FirebaseApp
//
//  Created by Абдулхаким Магомедов on 19.02.2022.
//

import SwiftUI
import Firebase
import LocalAuthentication

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    //MARK: Error
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""
    
    // Log status
    @AppStorage("log_status") var logStatus: Bool = false
    func loginUser(useFaceID: Bool, email: String = "", password: String = "") async throws {
        let _ = try await Auth.auth().signIn(withEmail: email != "" ? email: self.email, password: password != "" ? password: self.password)
        
        DispatchQueue.main.async {
            if useFaceID && self.faceIDEmail == ""{
                self.useFaceID = useFaceID
                self.faceIDEmail = self.email
                self.faceIDPassword = self.password
            }
            else{
                self.logStatus = true
            }
        }
    }
    
    func getBioMatricStatus() -> Bool {
        let scanner = LAContext()
        return scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none)
    }
    
    func authenticateUser() async throws {
        let status = try await LAContext().evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To login into App")
        
        if status {
            try await loginUser(useFaceID: useFaceID, email: self.faceIDEmail, password: self.faceIDPassword)
        }
    }
}
