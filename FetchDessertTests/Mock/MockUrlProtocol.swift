//
//  MochUrl.swift
//  FetchDessertTests
//
//  Created by Olha Dzhyhirei on 9/26/23.
//

import Foundation
@testable import FetchDessert

class MockURLProtocol: URLProtocol {
    static var simulateError = false
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if MockURLProtocol.simulateError {
            let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorUnknown, userInfo: nil)
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        else {
            let meals = [Meal(id: "1", name: "1", thumbnailURL: nil)]
            let responseData = Response(meals: meals)
            
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(responseData)
                let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)
                client?.urlProtocol(self, didReceive: response!, cacheStoragePolicy: .notAllowed)
                client?.urlProtocol(self, didLoad: data)
                client?.urlProtocolDidFinishLoading(self)
            }
            catch {
                client?.urlProtocol(self, didFailWithError: error)
            }
        }
    }
    
    override func stopLoading() {
    }
}
