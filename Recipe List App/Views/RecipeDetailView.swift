//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by User on 6/8/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    //We are setting the data type as recipe
    //We are not going to set this property to any particalar instance right now because we are going to rely on the RecipeListView to assign the partically recipe that we want to use to display the UI
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Spacer()
                    Text("Ingredients")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    ForEach(recipe.ingredients) { item in
                        Spacer()
                        Text("• " + item.name)
                    }
                }
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .fontWeight(.bold)
                    ForEach(recipe.directions, id:\.self) { list in
                        Spacer()
                        Text(list)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle(recipe.name)
    }
    
    struct RecipeDetailView_Previews: PreviewProvider {
        static var previews: some View {
            
            //Create a dummy recipe and pass it into the detail view so that we cna see a previewlet model = RecipeModel()
            let model = RecipeModel()
            
            RecipeDetailView(recipe: model.recipes[0])
        }
    }
}
