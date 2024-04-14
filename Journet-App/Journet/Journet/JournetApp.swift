//
//  JournetApp.swift
//  Journet
//
//  Created by 김라희 on 4/14/24.
//

import SwiftUI

@main
struct JournetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
