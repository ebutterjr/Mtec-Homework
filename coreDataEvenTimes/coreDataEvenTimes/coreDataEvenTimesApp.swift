//
//  coreDataEvenTimesApp.swift
//  coreDataEvenTimes
//
//  Created by Easton Butterfield on 12/9/22.
//

import SwiftUI

@main
struct coreDataEvenTimesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
