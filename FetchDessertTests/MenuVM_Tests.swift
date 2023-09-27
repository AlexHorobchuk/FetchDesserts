//
//  MenuVM_Tests.swift
//  FetchDessertTests
//
//  Created by Olha Dzhyhirei on 9/26/23.
//

import XCTest
@testable import FetchDessert

final class MenuVM_Tests: XCTestCase {
    
    var menuVM: MenuVM!
    var mockStorage: MockStorage!

    override func setUpWithError() throws {
        mockStorage = MockStorage()
        menuVM = MenuVM(storage: mockStorage)
    }

    override func tearDownWithError() throws {
        menuVM = nil
        mockStorage = nil
    }
    
    func test_MenuVM_setMeals_shouldBeEqual() async {
        // Given
        let mockedMeals = [Meal(id: "1", name: "Meal 1", thumbnailURL: nil)]
        mockStorage.mockMealsResult = .success(mockedMeals)

        // When
        let expectation = XCTestExpectation(description: "Should set after a second")
        menuVM.setMeals()
        let cancellable = menuVM.$alert
                    .sink { _ in
                        expectation.fulfill()
                    }
        
        await fulfillment(of: [expectation], timeout: 1)
        XCTAssertEqual(menuVM.meals, mockedMeals)
        XCTAssertNil(menuVM.alert)
        cancellable.cancel()
    }

    func test_MenuVM_setMeals_shouldBeError() async {
        // Given
        let mockedError = NetworkError.invalidData
        mockStorage.mockMealsResult = .failure(mockedError)

        // When
        let expectation = XCTestExpectation(description: "Should set after a second")
        menuVM.setMeals()
        let cancellable = menuVM.$alert
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }

        // Then
        await fulfillment(of: [expectation], timeout: 1)
        XCTAssertNotNil(menuVM.alert)
        XCTAssertTrue(menuVM.meals.isEmpty)
        cancellable.cancel()
    }
}
