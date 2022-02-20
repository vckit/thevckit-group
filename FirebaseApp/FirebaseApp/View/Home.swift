//
//  Home.swift
//  FirebaseApp
//
//  Created by Абдулхаким Магомедов on 20.02.2022.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @AppStorage("log_status") var logStatus: Bool = false
    
    
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    var body: some View {
        VStack (spacing: 20){
            if logStatus {
                Text("Logged In")
                Button("Loguot") {
                    try? Auth.auth().signOut()
                    logStatus = false
                }
            }
            else {
                Text("Came at Guest")
            }
            
            if useFaceID {
                Button("Disponse Face ID"){
                    useFaceID = false
                    faceIDEmail = ""
                    faceIDPassword = ""
                }
            }
        }
        .navigationBarHidden(true)
        .navigationTitle("Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
