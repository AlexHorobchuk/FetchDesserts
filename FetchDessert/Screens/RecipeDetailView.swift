//
//  MealDetail.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @StateObject var recipeVM: RecipeVM
    
    var body: some View {
        
        VStack {
            if recipeVM.recipe != nil {
                ScrollView{
                    VStack {
                        LoadingImage(imageSize: .large, url: recipeVM.selectedMeal.thumbnailURL ?? "")
                            .frame(width: 250, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                        
                        Section {
                            ForEach(recipeVM.recipe!.ingredients) { ingredient in
                                HStack {
                                    Text(ingredient.name)
                                    Spacer()
                                    Text(ingredient.measurement)
                                }
                            }
                        } header: {
                            Text("Ingredients")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                        }
                        
                        Section {
                            Text(recipeVM.recipe!.instructions)
                        } header: {
                            Text("Instructions")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                }
            }
            else {
                ProgressView()
            }
        }
        .navigationTitle(recipeVM.selectedMeal.name)
        .task {
            recipeVM.setRecipe()
        }
        .alert(item: $recipeVM.alert) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton )
        }
    }
}

struct MealDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeVM: RecipeVM(storage: NetworkManager(), selectedMeal: MockData.meal))
    }
}
