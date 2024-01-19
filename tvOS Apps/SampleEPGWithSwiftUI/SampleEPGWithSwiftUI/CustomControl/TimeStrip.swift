//
//  TimeStrip.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 07/02/2023.
//

import Foundation
import SwiftUI

struct TimeStrip: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.white)
            .padding()
            .background(Color(UIColor.clear))
            .frame(width:250, height:50)
            .background(backgroundView(content: content))
            .multilineTextAlignment(.leading)
    }
   
    @ViewBuilder private func backgroundView(content: Content) -> some View {
        timeStripBackground
    }
  
    private var timeStripBackground : some View {
        LinearGradient(
          colors: [Color(UIColor.clear)],
          startPoint: .topLeading,
          endPoint: .bottomTrailing)
    }
}
