//
//  CustomScrollView.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 09/02/2023.
//

import Foundation
import SwiftUI

struct CustomScrollView<Content>: View where Content: View {
    let axes: Axis.Set
    let showIndicators: Bool
    @Binding var contentOffset: CGFloat
    let content: Content
    
    public init(_ axes: Axis.Set = .vertical, showIndicators: Bool = true, contentOffset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self.showIndicators = showIndicators
        self._contentOffset = contentOffset
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { outsideProxy in
            ScrollView(self.axes, showsIndicators: self.showIndicators) {
                ZStack(alignment: self.axes == .vertical ? .top : .leading) {
                    GeometryReader { insideProxy in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: [self.calculateContentOffset(fromOutsideProxy: outsideProxy, insideProxy: insideProxy)])
                       
                    }
                    VStack {
                        self.content
                    }
                }
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    print("=====vl offset====== :  \(value)")
                    self.contentOffset = value[0]
                }
            }
        }
    }
    
    private func calculateContentOffset(fromOutsideProxy outsideProxy: GeometryProxy, insideProxy: GeometryProxy) -> CGFloat {
        if axes == .vertical {
//            print (" vertical --> outsideProxy : \(outsideProxy) | insideProxy : \(insideProxy)")
            return outsideProxy.frame(in: .global).minY - insideProxy.frame(in: .global).minY
        } else {
//            print (" horizontal --> outsideProxy : \(outsideProxy) | insideProxy : \(insideProxy)")
            return outsideProxy.frame(in: .global).minX - insideProxy.frame(in: .global).minX
        }
    }
}

