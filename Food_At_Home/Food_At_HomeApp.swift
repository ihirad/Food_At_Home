//
//  Food_At_HomeApp.swift
//  Food_At_Home
//
//  Created by hi on 1/25/25.
//

import SwiftUI

@main
struct Food_At_HomeApp: App {
    @State var databaseManager = DatabaseManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(databaseManager)

        }
    }
}
