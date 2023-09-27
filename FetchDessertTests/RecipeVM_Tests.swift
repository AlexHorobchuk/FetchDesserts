//
//  RecipeVM_Tests.swift
//  FetchDessertTests
//
//  Created by Olha Dzhyhirei on 9/26/23.
//

import XCTest
@testable import FetchDessert

final class RecipeVM_Tests: XCTestCase {

    var recipeVM: RecipeVM!
    var mockStorage: MockStorage!
    
    override func setUpWithError() throws {
        mockStorage = MockStorage()
        recipeVM = RecipeVM(storage: mockStorage, selectedMeal: Meal(id: "1", name: "Meal 1", thumbnailURL: nil))
    }

    override func tearDownWithError() throws {
        recipeVM = nil
        mockStorage = nil
    }

    func test_RecipeVM_setRecipe_shouldBeEqual() async {
        // Given
        let mockedRecipe = Recipe(name: "Recipe 1", instructions: "Instruction", ingredients: [Ingredient(name: "butter", measurement: "1")])
        mockStorage.mockRecipesResult = .success(mockedRecipe)
        
        // When
        let expectation = XCTestExpectation(description: "Should set after a second")
        recipeVM.setRecipe()
        
        let cancellable = recipeVM.$recipe
            .sink { _ in
                expectation.fulfill()
            }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1)
        XCTAssertEqual(recipeVM.recipe, mockedRecipe)
        XCTAssertNil(recipeVM.alert)
        cancellable.cancel()
    }

    func test_RecipeVM_setRecipe_shouldBeError() async {
        // Given
        let mockedError = NetworkError.invalidData
        mockStorage.mockRecipesResult = .failure(mockedError)
        
        // When
        let expectation = XCTestExpectation(description: "Should set after a second")
        recipeVM.setRecipe()
        
        let cancellable = recipeVM.$alert
            .sink { _ in
                expectation.fulfill()
            }
        
        // Then
        await fulfillment(of: [expectation], timeout: 2)
        XCTAssertNotNil(recipeVM.alert)
        XCTAssertNil(recipeVM.recipe)
        cancellable.cancel()
    }
}
