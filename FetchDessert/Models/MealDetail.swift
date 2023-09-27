//
//  MealDetail.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/24/23.
//

import Foundation

struct MealDetail: Codable {
    
    let name: String
    let instructions: String
    
    let ingredient1: String
    let ingredient2: String
    let ingredient3: String
    let ingredient4: String
    let ingredient5: String
    let ingredient6: String
    let ingredient7: String
    let ingredient8: String
    let ingredient9: String
    let ingredient10: String
    let ingredient11: String
    let ingredient12: String
    let ingredient13: String
    let ingredient14: String
    let ingredient15: String

    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    
    let measurement1: String
    let measurement2: String
    let measurement3: String
    let measurement4: String
    let measurement5: String
    let measurement6: String
    let measurement7: String
    let measurement8: String
    let measurement9: String
    let measurement10: String
    let measurement11: String
    let measurement12: String
    let measurement13: String
    let measurement14: String
    let measurement15: String
    
    let measurement16: String?
    let measurement17: String?
    let measurement18: String?
    let measurement19: String?
    let measurement20: String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "strMeal"
        case instructions = "strInstructions"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"

        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
        case measurement16 = "strMeasure16"
        case measurement17 = "strMeasure17"
        case measurement18 = "strMeasure18"
        case measurement19 = "strMeasure19"
        case measurement20 = "strMeasure20"
    }
}

extension MealDetail {
    func toRecipe() -> Recipe {
        let ingredientList = [
            Ingredient(name: self.ingredient1, measurement: self.measurement1),
            Ingredient(name: self.ingredient2, measurement: self.measurement2),
            Ingredient(name: self.ingredient3, measurement: self.measurement3),
            Ingredient(name: self.ingredient4, measurement: self.measurement4),
            Ingredient(name: self.ingredient5, measurement: self.measurement5),
            Ingredient(name: self.ingredient6, measurement: self.measurement6),
            Ingredient(name: self.ingredient7, measurement: self.measurement7),
            Ingredient(name: self.ingredient8, measurement: self.measurement8),
            Ingredient(name: self.ingredient9, measurement: self.measurement9),
            Ingredient(name: self.ingredient10, measurement: self.measurement10),
            Ingredient(name: self.ingredient11, measurement: self.measurement11),
            Ingredient(name: self.ingredient12, measurement: self.measurement12),
            Ingredient(name: self.ingredient13, measurement: self.measurement13),
            Ingredient(name: self.ingredient14, measurement: self.measurement14),
            Ingredient(name: self.ingredient15, measurement: self.measurement15),
            Ingredient(name: self.ingredient16 ?? "", measurement: self.measurement16 ?? ""),
            Ingredient(name: self.ingredient17 ?? "", measurement: self.measurement17 ?? ""),
            Ingredient(name: self.ingredient18 ?? "", measurement: self.measurement18 ?? ""),
            Ingredient(name: self.ingredient19 ?? "", measurement: self.measurement19 ?? ""),
            Ingredient(name: self.ingredient20 ?? "", measurement: self.measurement20 ?? ""),
        ]
        
        return Recipe(name: self.name,
                      instructions: self.instructions,
                      ingredients: ingredientList)
    }
}
