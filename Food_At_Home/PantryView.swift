//
//  PantryView.swift
//  Food_At_Home
//
//  Created by hi on 1/27/25.
//

import SwiftUI


struct PantryView: View {
    @Environment(DatabaseManager.self) var databaseManager: DatabaseManager

    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    ForEach(databaseManager.pantry, id: \.id) {
                        ingredient in
                        NavigationLink(ingredient.ingredient) {
                            DetailView(taskName: ingredient.ingredient)
                        }
                    }
                }, header: {
                    TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Select an item to find a recipe")
                })
            }
            .task{
                await databaseManager.fetchPantry()
            }
            .navigationTitle(Text("Pantry"))
            
            Button("Continue") {
                print("pressed")
                }
        }
    }
}

struct HeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundStyle(.green)
            .textCase(.uppercase)
    }
}

extension View {
    func headerStyle() -> some View {
        self.modifier(HeaderStyle())
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    
    var body: some View {
        HStack {
            Image(systemName: symbolSystemName)
            Text(headerText)
        }
        .headerStyle()
    }
}

#Preview {
    PantryView()
        .environment(DatabaseManager())
}

#Preview("PantryView Landscape", traits: .landscapeRight, body: {
    PantryView()
        .environment(DatabaseManager())
})

struct PantryView_Previews: PreviewProvider {
    static var previews: some View {
        PantryView()
            .environment(DatabaseManager())
    }
}



//import SwiftUI
//
//struct PantryView: View {
//    var body: some View {
//        NavigationStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
//        .navigationTitle("Pantry")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//#Preview {
//    PantryView()
//}
