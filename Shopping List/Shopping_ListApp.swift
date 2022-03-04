//
//  Shopping_ListApp.swift
//  Shopping List
//
//  Created by Luca Salmi on 2022-03-04.
//

import SwiftUI

@main
struct Shopping_ListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
