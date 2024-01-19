//
//  ContentView.swift
//  MyProfile
//
//  Created by Sweda Thiyagarajan on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Info Color").edgesIgnoringSafeArea(.all)
            VStack {
                Image("Sweda")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 300.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5.0))
                Text("Sweda Thiyagarajan")
                    .font(Font.custom("Festive-Regular", size: 50))
                    .bold()
                .foregroundColor(.white)
                Text("iOS Developer")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+32 9842052475", image: "phone.fill")
                InfoView(text: "swethi@gmail.com", image: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

