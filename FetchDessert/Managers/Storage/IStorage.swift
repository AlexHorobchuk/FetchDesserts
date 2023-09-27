//
//  IStorage.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/24/23.
//

import Foundation

protocol IStorage: AnyObject, IMealGetter, IRecipeGetter {
    
    func getMeals(completion: @escaping (Result<[Meal], Error>) -> Void)
    
    func getRecipes(id: String, completion: @escaping (Result<Recipe, Error>) -> Void)
}

protocol IMealGetter: AnyObject {
    
    func getMeals(completion: @escaping (Result<[Meal], Error>) -> Void)
}

protocol IRecipeGetter: AnyObject {
    
    func getRecipes(id: String, completion: @escaping (Result<Recipe, Error>) -> Void)
}
