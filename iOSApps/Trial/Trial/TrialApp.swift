//
//  TrialApp.swift
//  Trial
//
//  Created by Sweda Thiyagarajan on 09/07/2021.
//

import SwiftUI

@main
struct TrialApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
