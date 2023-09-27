//
//  SortedStorage_Tests.swift
//  FetchDessertTests
//
//  Created by Olha Dzhyhirei on 9/26/23.
//

import XCTest
@testable import FetchDessert

final class SortedStorage_Tests: XCTestCase {

    var sortedStorage: SortedStorage!
    var mockStorage: MockStorage!
    
    override func setUpWithError() throws {
        mockStorage = MockStorage()
        sortedStorage = SortedStorage(storage: mockStorage)
    }

    override func tearDownWithError() throws {
        mockStorage = nil
        sortedStorage = nil
    }
    
    func test_SortedStorage_shouldBeEmpty() {
        // Given
        mockStorage.mockMealsResult = .success([])
        
        // When
        sortedStorage.getMeals { sortedItems in
            
            // Then
            switch sortedItems {
            case .success(let items):
                XCTAssertTrue(items.isEmpty)

            case .failure( _ ):
                XCTFail()
            }
        }
    }

    func test_SortedStorage_shouldSortMealsItems() {
        // Given
        let meal1 = Meal(id: "1", name: "Meal 1", thumbnailURL: nil)
        let meal2 = Meal(id: "2", name: "Meal 2", thumbnailURL: nil)
        let meal3 = Meal(id: "3", name: "Meal 3", thumbnailURL: nil)
        
        mockStorage.mockMealsResult = .success([meal2, meal3, meal1])
        
        // When
        sortedStorage.getMeals { sortedItems in

            // Then
            switch sortedItems {
            case .success(let items):
                XCTAssertEqual(items, [meal1, meal2, meal3])

            case .failure( _ ):
                XCTFail()
            }
        }
    }
    
    func test_GetRecipes_shouldSortIngredients() {
        // Given
        let mealId = "1"
        let originalRecipe = Recipe(name: "Recipe 1", instructions: "Instructions 1", ingredients: [
            Ingredient(name: "Banana", measurement: "2"),
            Ingredient(name: "Apple", measurement: "1"),
            Ingredient(name: "", measurement: "1"),
            Ingredient(name: "Orange", measurement: ""),
            Ingredient(name: "", measurement: "")
        ])
        
        let expectedSortedIngredients = [
            Ingredient(name: "Apple", measurement: "1"),
            Ingredient(name: "Banana", measurement: "2"),
        ]
        
        mockStorage.mockRecipesResult = .success(originalRecipe)
        
        // When
        sortedStorage.getRecipes(id: mealId) { result in
            
            // Then
            switch result {
            case .success(let recipe):
                XCTAssertEqual(recipe.ingredients, expectedSortedIngredients)
                
            case .failure(_):
                XCTFail()
            }
        }
    }
}
