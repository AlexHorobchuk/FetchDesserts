//
//  NetworkManager.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/24/23.
//

import Foundation

class NetworkManager: IStorage {
    
    private let mealsUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    private let recipeUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    private func fetchData<T: Decodable>(link: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: link) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.unableToComplete))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.invalidData))
                }
                return
            }
            
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.invalidData))
                }
            }
        }.resume()
    }
    
    func getMeals(completion: @escaping (Result<[Meal], Error>) -> Void) {
        fetchData(link: mealsUrl) { (result: Result<Response<[Meal]>, Error>) in
            
            switch result {
                
            case .success(let response):
                completion(.success(response.meals))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRecipes(id: String, completion: @escaping (Result<Recipe, Error>) -> Void) {
        fetchData(link: (recipeUrl + id)) { (result: Result<Response<[MealDetail]>, Error>) in
            
            switch result {
                
            case .success(let response):
                if let mealDetail = response.meals.first {
                    let recipe = mealDetail.toRecipe()
                    completion(.success(recipe))
                }
                else {
                    completion(.failure(NetworkError.invalidData))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
