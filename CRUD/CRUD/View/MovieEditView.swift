//
//  MovieEditView.swift
//  CRUD
//
//  Created by Абдулхаким Магомедов on 09.12.2021.
//

import SwiftUI

enum Mode {
    case new
    case edit
}

enum Action {
    case delete
    case done
    case cancel
}

struct MovieEditView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MovieEditView_Previews: PreviewProvider {
    static var previews: some View {
        MovieEditView()
    }
}
