//
//  CustomCircleView.swift
//  Hike
//
//  Created by Sweda Thiyagarajan on 13/12/2023.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimationGradient: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.customIndigoMedium, .customSalmonLight],
                        startPoint: isAnimationGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimationGradient ? .bottomTrailing : .topTrailing))
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimationGradient.toggle()
                    }
                }
            MotionAnimationView()
        }
        .frame(width:256, height:256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
