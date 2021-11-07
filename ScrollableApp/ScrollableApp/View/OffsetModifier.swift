//
//  OffsetModifier.swift
//  ScrollableApp
//
//  Created by Абдулхаким Магомедов on 06.11.2021.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    @Binding var rect: CGRect
    func body(content: Content) -> some View {
        content
            .overlay (
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")))
                }
            )
            .onPreferenceChange (OffsetKey.self) { value in
                self.rect = value
            }
    }
}

