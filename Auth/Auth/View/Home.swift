//
//  Home.swift
//  Auth
//
//  Created by Абдулхаким Магомедов on 18.11.2021.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack{
            
            Text("Home")
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
            }) {
                
                Text("Logout")
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
