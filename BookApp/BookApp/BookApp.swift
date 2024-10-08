//
//  BookApp.swift
//  BookApp
//
//  Created by Sandro Boka on 08.10.2024..
//

import Foundation
import SwiftUI

@main
struct BookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
