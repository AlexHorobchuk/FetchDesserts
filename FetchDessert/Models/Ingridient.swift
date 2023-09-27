//
//  Ingridient.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/24/23.
//

import Foundation

struct Ingredient: Identifiable, Equatable {
    
    let id = UUID()
    let name: String
    let measurement: String
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.name == rhs.name &&
        lhs.measurement == rhs.measurement
    }
}
