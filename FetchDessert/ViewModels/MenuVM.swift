//
//  MenuVM.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import Foundation


final class MenuVM: ObservableObject, AlertHandler {
    
    @Published private(set) var meals = [Meal]()
    @Published var alert: AlertItem?
    
    let storage: IMealGetter
    
    init(storage: IMealGetter) {
        self.storage = storage
    }
    
    func setMeals() {
        storage.getMeals() { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let meals):
                    self?.meals = meals

                case .failure(let error):
                    self?.handleError(error)
                }
            }
        }
    }
}
