//
//  View+TimeStrip.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 07/02/2023.
//

import Foundation
import SwiftUI

extension View {
    func timeStripStyle() -> some View {
        modifier(TimeStrip())
    }
}
