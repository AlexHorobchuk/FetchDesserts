//
//  NetworkManager_Tests.swift
//  FetchDessertTests
//
//  Created by Olha Dzhyhirei on 9/26/23.
//

import XCTest
@testable import FetchDessert

final class NetworkManager_Tests: XCTestCase {
    
    var networkManager: NetworkManager!
    
    override func setUpWithError() throws {
        networkManager = NetworkManager()
        
        URLProtocol.registerClass(MockURLProtocol.self)
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
        
        URLProtocol.unregisterClass(MockURLProtocol.self)
    }


    func testGetMeals() {
        //when
        networkManager.getMeals { result in
            switch result {
            case .success(let meals):
                //then
                XCTAssertNotNil(meals)
                XCTAssertEqual(meals.count, 1)
                XCTAssertEqual(meals[0].id, "1")

            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testGetMealsFailure() {
        //given
        MockURLProtocol.simulateError = true
        
        //when
        networkManager.getMeals { result in
            switch result {
            case .success(_):
                XCTFail()
                
            case .failure(let error):
                //Then
                XCTAssertNotNil(error)
            }
        }
    }
}
