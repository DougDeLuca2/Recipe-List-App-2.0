//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by User on 6/7/23.
//

import Foundation

class RecipeModel:ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //Create an instance of dataService and get the data
        let service = DataService()
        
        //This is going to return a list of recipes
        self.recipes = service.getLocalData()
    }
}
