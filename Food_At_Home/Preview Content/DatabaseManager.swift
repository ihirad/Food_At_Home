//
//  DatabaseManager.swift
//  Food_At_Home
//
//  Created by hi on 1/25/25.
//

import SwiftUI

@Observable
class DatabaseManager {
    let baseURL = URL(string: "http://127.0.0.1:5000")!
    var signedIn: Bool = false
    var pantry: [Ingredient] = []
    
    func signInWith(username: String, password: String) async {
        let url = URL(string: "\(baseURL)/users/login")!
        
        // build the Body of the Request
        let loginRequest = LoginRequest(username: username, password: password)
        
        // Build Request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(loginRequest)
        
        // Build Session
        let session = URLSession(configuration: .default)
        do {
            let (data, response) = try await session.data(for: request)
            print("Data: \(data)")
            let jsonDataResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            print("Message: \(jsonDataResponse.message)")
            print("Response: \(response)")
            if jsonDataResponse.message.localizedCaseInsensitiveContains("logged in") {
                signedIn = true
            }
        } catch {
            print("Error with users/login call: \(error)")
        }
    }
    
    func fetchPantry() async {
        let url = baseURL.appendingPathComponent("ingredients")
        
        // Build request (GET)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        do {
            let (data, response) = try await session.data(for: request)
            // Decode JSON into our IngredientsResponse model
            let decodedResponse = try JSONDecoder().decode(IngredientsResponse.self, from: data)
            
            // Store or process the ingredients
            pantry = decodedResponse.ingredients
            
            // For demo purposes, print them out
            for item in pantry {
                print("Ingredient ID: \(item.id), Name: \(item.ingredient)")
            }
            
            print("HTTP Response: \(response)")
            
        } catch {
            print("Error fetching pantry/ingredients: \(error)")
        }
    }
    
}

