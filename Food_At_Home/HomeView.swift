//
//  HomeView.swift
//  Food_At_Home
//
//  Created by hi on 1/28/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(DatabaseManager.self) var databaseManager: DatabaseManager
    
    var body: some View {
        if databaseManager.signedIn {
            PantryView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    HomeView()
        .environment(DatabaseManager())
}
