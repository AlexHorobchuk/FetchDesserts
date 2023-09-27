//
//  FetchDessertApp.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import SwiftUI

@main
struct FetchDessertApp: App {
    
    let storage = SortedStorage(storage: NetworkManager())
    
    var body: some Scene {
        
        WindowGroup {
            MenuView(menuVM: MenuVM(storage: storage))
        }
    }
}
