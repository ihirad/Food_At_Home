//
//  SwiftUIView.swift
//  Food_At_Home
//
//  Created by hi on 1/25/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(DatabaseManager.self) var databaseManager: DatabaseManager
    
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            if databaseManager.signedIn {
                Text("Signed In")
            } else {
                Text("Not Signed In")
            }
            
            Text("Login")
                .font(.largeTitle)
            
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("Password", text: $password)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button("Continue") {
                print("Continuing with username: \(username) password: \(password)")
                Task {
                    await databaseManager.signInWith(username: username, password: password)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    LoginView()
        .environment(DatabaseManager())
}
