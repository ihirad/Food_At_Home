//
//  DetailView.swift
//  Food_At_Home
//
//  Created by hi on 1/28/25.
//

import SwiftUI

struct DetailView: View {
    var taskName: String
    
    var body: some View {
        VStack {
            Text(taskName)
            Text("Placeholder for task description")
            Text("Placeholder for mark complete button")
        }
    }
}

#Preview {
    DetailView(taskName: "Check all windows")
}
