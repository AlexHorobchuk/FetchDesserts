//
//  Meal.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import Foundation

struct Meal: Codable, Comparable {
    
    let id: String
    let name: String
    let thumbnailURL: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
    }
    
    static func <(lhs: Meal, rhs: Meal) -> Bool {
        return lhs.name < rhs.name
    }
}
