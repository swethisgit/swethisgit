//
//  TrackerApp.swift
//  Tracker
//
//  Created by Sweda Thiyagarajan on 14/07/2021.
//

import SwiftUI

@main
struct TrackerApp: App {
    @StateObject var locations = Locations()
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationView{
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                }
                NavigationView{
                    WorldView()
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Locations")
                }
                NavigationView{
                    Tips()
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tips")
                }

            }
            .environmentObject(locations)
        }
    }
}
