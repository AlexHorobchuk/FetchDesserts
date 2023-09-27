//
//  AlertHandler.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/24/23.
//

import Foundation

protocol AlertHandler: ObservableObject {
    
    var alert: AlertItem? { get set }
    
    func handleError(_ error: Error)
}

extension AlertHandler {
    
    func handleError(_ error: Error) {
        if let networkError = error as? NetworkError {
            
            switch networkError {
                
            case .invalidURL:
                alert = AlertContext.invalidURL
                
            case .invalidResponse:
                alert = AlertContext.invalidResponse

            case .invalidData:
                alert = AlertContext.invalidData
            
            case .unableToComplete:
                alert = AlertContext.unableToComplete
            }
        } else {
            alert = AlertContext.unableToComplete
        }
    }
}
