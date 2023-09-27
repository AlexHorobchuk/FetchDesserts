//
//  ContentView.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var menuVM : MenuVM
    
    var body: some View {
        
        NavigationView {
            
            List(menuVM.meals, id: \.name) { meal in
                NavigationLink(
                    destination: RecipeDetailView(recipeVM: RecipeVM(storage: menuVM.storage as! IRecipeGetter, selectedMeal: meal))) {
                    
                    HStack {
                        LoadingImage(imageSize: .small, url: meal.thumbnailURL ?? "")
                        
                        Text("\(meal.name)")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Desserts")
            .task {
                menuVM.setMeals()
            }
            .alert(item: $menuVM.alert) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menuVM: MenuVM(storage: NetworkManager()))
    }
}
