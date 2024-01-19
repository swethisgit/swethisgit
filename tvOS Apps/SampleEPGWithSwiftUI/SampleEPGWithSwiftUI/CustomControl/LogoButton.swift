//
//  LogoButton.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 07/02/2023.
//

import Foundation
import SwiftUI

struct LogoButton: ButtonStyle {
    @Environment(\.isFocused) private var isFocused
    
    private let imageUrl: String
    private let width: CGFloat
    private let height: CGFloat
    private var isRounded: Bool
    
    init(
        width: CGFloat,
        height: CGFloat,
        isRounded: Bool = true,
        imageUrl: String
    ) {
        self.width = width
        self.height = height
        self.imageUrl = imageUrl
        self.isRounded = isRounded
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            configuration.label
        }
        .frame(width: width, height: height)
        .background(backgroundView(configuration: configuration))
        .cornerRadius(isRounded ? 15 : 0)
        .onChange(of: isFocused ){ newValue in
            print("\(newValue)")
        }
    }
        
    @ViewBuilder private func backgroundView (
      configuration: Configuration
    ) -> some View {
        loadImage
        if isFocused {
            focusedBackground
        }
    }

    private var loadImage: some View {
        let url:URL? = URL(string: imageUrl)
        if let urlToLoad = url {
            let imgData:Data? = try? Data(contentsOf: urlToLoad)
            if let imageData:Data = imgData {
                if let img = UIImage(data: imageData) {
                    let newImg = Image(uiImage: img).resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    
                    return newImg
                }
            }
        }
        return Image(systemName: "airtag.fill")
    }
    
    private var focusedBackground: some View {
      LinearGradient(
        colors: [.purple],  //[Color(UIColor(hexString: "#7441ba") ?? .purple) ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
      .opacity(0.4)
    }
}
