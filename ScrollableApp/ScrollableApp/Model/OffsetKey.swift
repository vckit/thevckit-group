//
//  OffsetKey.swift
//  ScrollableApp
//
//  Created by Абдулхаким Магомедов on 06.11.2021.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
