//
//  SortedStorage.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/24/23.
//

import Foundation

final class SortedStorage: IStorage {
    
    
    private let storage: IStorage
    
    init(storage: IStorage) {
        self.storage = storage
    }
    
    func getMeals(completion: @escaping (Result<[Meal], Error>) -> Void) {
        storage.getMeals { result in
            
            switch result {
                
            case .success(let meals):
                let sortedMeals = meals.sorted { $0.name < $1.name }
                completion(.success(sortedMeals))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRecipes(id: String, completion: @escaping (Result<Recipe, Error>) -> Void) {
        storage.getRecipes(id: id) { result in
            
            switch result {
                
            case .success(let recipe):
                let sortedIngredients = recipe.ingredients.filter { !($0.name.isEmpty || $0.measurement.isEmpty) } .sorted(by: { $0.name < $1.name })
                let sortedRecipe = Recipe(name: recipe.name, instructions: recipe.instructions, ingredients: sortedIngredients)
                completion(.success(sortedRecipe))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
