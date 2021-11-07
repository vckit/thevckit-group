//
//  Letter.swift
//  ScrollableApp
//
//  Created by Абдулхаким Магомедов on 06.11.2021.
//

import SwiftUI

struct Letter: Hashable, Identifiable {
    var id = UUID().uuidString
    var date: String
    var title: String
}

var letters: [Letter] = [
    Letter(date: "March 31 2004", title: "Happy Birthday"),
    Letter(date: "September 13 2002", title: "Happy Birthday"),
    Letter(date: "October 1 2019", title: "My love")
]
