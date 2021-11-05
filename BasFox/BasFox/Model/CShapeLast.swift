//
//  CShapeLast.swift
//  BasFox
//
//  Created by Абдулхаким Магомедов on 05.11.2021.
//

import SwiftUI

struct CShapeLast: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}
