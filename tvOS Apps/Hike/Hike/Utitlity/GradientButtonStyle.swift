//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Sweda Thiyagarajan on 12/12/2023.
//

import Foundation
import SwiftUI

struct GradientButton : ButtonStyle {
    func makeBody(configuration : Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Mark: - conditional statement to check button status
                configuration.isPressed ?
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                :
                    LinearGradient(
                        colors: [
                            .customGrayMedium,
                            .customGrayLight],
                        startPoint: .top,
                        endPoint: .bottom
                    )
            )
            
            .cornerRadius(40)
    }
}
