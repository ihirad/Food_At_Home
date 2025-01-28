//
//  Requests.swift
//  Food_At_Home
//
//  Created by hi on 1/25/25.
//

import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let message: String
}

struct IngredientsResponse: Codable {
    let ingredients: [Ingredient]
}

struct Ingredient: Codable {
    let id: Int
    let ingredient: String
}


