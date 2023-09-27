//
//  ImageSize.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import Foundation

enum ImageSize {
    
    case small, large
    
    func getCornerRedaius() -> CGFloat {
        
        switch self {
            
        case .small:
            return 10
        case .large:
            return 20
        }
    }
    
    func getSize() -> CGSize {
        
        switch self {
            
        case .small:
            return CGSize(width: 50, height: 50)
        case .large:
            return CGSize(width: 270, height: 270)
        }
    }
}
