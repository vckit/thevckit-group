//
//  Movie.swift
//  CRUD
//
//  Created by Абдулхаким Магомедов on 09.12.2021.
//

import Foundation
import FirebaseFirestoreSwift


struct Movie : Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var year: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case year
    }
}
