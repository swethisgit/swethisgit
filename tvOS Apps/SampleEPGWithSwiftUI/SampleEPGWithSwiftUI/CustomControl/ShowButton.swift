//
//  ShowButton.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 07/02/2023.
//

import Foundation
import SwiftUI

struct ShowButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.isFocused) private var isFocused
    private var imgWidth:CGFloat = 256
    
    private let colors: [Color]
    private let width: CGFloat
    private let height: CGFloat
    private var isRounded: Bool
    private var isCategory: Bool
    private let imageUrl: String
    private let timing: String
    private let title: String
    
    init( width: CGFloat,
          height: CGFloat,
          isRounded: Bool = true,
          imageUrl: String =  "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
          isCategory: Bool = false,
          timing: String = "12:00 AM to 01:30 AM",
          title: String = "Zootopia",
          colors: [Color] = [.mint.opacity(0.6), .mint, .mint.opacity(0.6), .mint]
    ) {
        self.colors = colors
        self.width = width
        self.height = height
        self.isRounded = isRounded
        self.isCategory = isCategory
        self.imageUrl = imageUrl
        self.timing = timing
        self.title = title
    }
    
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            configuration.label
        }
        .font(.body.bold())
        .foregroundColor(isEnabled ? .white : .clear)
        .padding()
        .frame(width: width, height: height)
        .background(backgroundView(configuration: configuration))
        .cornerRadius(isRounded ? 15 : 0)
        .onChange(of: isFocused ){ newValue in
            print("\(newValue)")
        }
    }
    
    func makeThumbnail(configuration: Configuration)  -> some View {
        let url:URL? = URL(string: imageUrl)
        if let urlToLoad = url {
            return   AsyncImage(url: urlToLoad,
                                    placeholder: { Text("Loading ...") })
        }
        return   AsyncImage(url: url!,
                                placeholder: { Text("Loading ...") })
    }
    
    func makeTextView(configuration: Configuration) -> some View {
        return VStack (alignment: .leading){
            Text(timing)
            Text(title)
        }
        .border(Color.orange, width: 5)
    }
    
    func makeBackgroundStack(configuration: Configuration) -> some View {
        
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                makeThumbnail(configuration: configuration)
            }
            .frame(width: imgWidth , height: 144, alignment: .leading)
            Spacer().frame(width: 10)
            VStack(alignment: .leading) {
                Text(timing).padding()
                Text(title).padding()
            }
            .frame(width: (width-imgWidth-20),  height: height, alignment: .leading)
        }
        .padding()
        .frame(width: width, height: height)
        .background(colors[0])
        
    }
    
    @ViewBuilder private func backgroundView(
        configuration: Configuration
    ) -> some View {
        //        makeBackgroundStack(configuration: configuration)\
        if isCategory {
            enabledBackground
            if isFocused {
                focusedBackground
            }
        } else {
            makeBackgroundStack(configuration: configuration)
            if isFocused {
                focusedTransparentBackground
            }
        }
        
        
        
    }
    
    private var enabledBackground: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    private var pressedBackground: some View {
        LinearGradient(
            colors: [Color(UIColor(hexString: "#7441ba") ?? .yellow) ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .opacity(0.4)
    }
    
    private var focusedBackground: some View {
        LinearGradient(
            colors: [.purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    private var focusedTransparentBackground: some View {
        LinearGradient(
            colors: [.purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .opacity(0.5)
    }
    
}
