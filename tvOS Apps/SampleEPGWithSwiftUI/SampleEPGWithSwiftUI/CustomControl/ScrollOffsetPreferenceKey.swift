//
//  ScrollOffsetPreferenceKey.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 28/02/2023.
//

import Foundation
import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}
