//
//  RecipeVM.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import Foundation

final class RecipeVM: ObservableObject, AlertHandler {
    
    @Published private(set) var recipe: Recipe?
    @Published var alert: AlertItem?
    
    let selectedMeal: Meal
    
    private let storage: IRecipeGetter
    
    init(storage: IRecipeGetter, selectedMeal: Meal) {
        self.storage = storage
        self.selectedMeal = selectedMeal
    }
    
    func setRecipe() {
        storage.getRecipes(id: selectedMeal.id) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                    
                case .success(let recipe):
                    self?.recipe = recipe
                    
                case .failure(let error):
                    self?.handleError(error)
                }
            }
        }
    }
}
