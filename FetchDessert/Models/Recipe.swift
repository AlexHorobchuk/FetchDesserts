//
//  MealRecipe.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import Foundation

struct Recipe: Equatable{
    
    let name: String
    let instructions: String
    let ingredients: [Ingredient]
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.name == rhs.name &&
            lhs.instructions == rhs.instructions &&
            lhs.ingredients == rhs.ingredients
    }
}
