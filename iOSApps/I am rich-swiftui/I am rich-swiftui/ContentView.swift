//
//  ContentView.swift
//  I am rich-swiftui
//
//  Created by Sweda Thiyagarajan on 21/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Hai watch")
                .font(.system(size: 60))
                .foregroundColor(Color.red)
            .padding()
                Image("diamond").resizable().aspectRatio(contentMode: .fit).frame(width: 300.0, height: 300.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
    }
}
