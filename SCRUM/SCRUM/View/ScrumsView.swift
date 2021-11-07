//
//  ScrumsView.swift
//  SCRUM
//
//  Created by Абдулхаким Магомедов on 30.10.2021.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums, id: \.title){ scrum in
            CardView(scrum: scrum)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
    }
}
