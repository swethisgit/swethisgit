//
//  ContentView.swift
//  Tracker
//
//  Created by Sweda Thiyagarajan on 14/07/2021.
//

import SwiftUI

struct ContentView: View {
    let location: Location
    var body: some View {
        ScrollView{
            Image(location.heroPicture).resizable().scaledToFit()
            Text(location.name).font(.largeTitle).bold().multilineTextAlignment(.center)
            Text(location.country).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.secondary)
            Text(location.description)
                .padding(.horizontal)
            Text("DID YOU KNOW")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.top)
            Text(location.more)
                .padding(.horizontal)
        }
        .navigationTitle("Discover")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(location:Locations().primary)
        }
    }
}
