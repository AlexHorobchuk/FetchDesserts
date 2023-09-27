//
//  Response.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/24/23.
//

import Foundation

struct Response<T:Codable>: Codable {
    
    var meals: T
}
