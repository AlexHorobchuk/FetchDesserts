//
//  MockStorage.swift
//  FetchDessertTests
//
//  Created by Olha Dzhyhirei on 9/26/23.
//

import Foundation
@testable import FetchDessert

class MockStorage: IStorage {
    
    var mockMealsResult: Result<[FetchDessert.Meal], Error>?
    var mockRecipesResult: Result<FetchDessert.Recipe, Error>?

    init(mockMealsResult: Result<[FetchDessert.Meal], Error>? = nil, mockRecipesResult: Result<FetchDessert.Recipe, Error>? = nil) {
        self.mockMealsResult = mockMealsResult
        self.mockRecipesResult = mockRecipesResult
    }
    
    func getMeals(completion: @escaping (Result<[FetchDessert.Meal], Error>) -> Void) {
        if let result = mockMealsResult {
            completion(result)
        }
    }

    func getRecipes(id: String, completion: @escaping (Result<FetchDessert.Recipe, Error>) -> Void) {
        if let result = mockRecipesResult {
            completion(result)
        }
    }
}
