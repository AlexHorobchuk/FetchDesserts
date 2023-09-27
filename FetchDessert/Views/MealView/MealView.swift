//
//  MealView.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import SwiftUI

struct MealView: View {
    
    let meal: Meal
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(meal: MockData.meal)
    }
}
