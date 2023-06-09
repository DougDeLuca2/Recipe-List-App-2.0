//
//  DataaService.swift
//  Recipe List App
//
//  Created by User on 6/7/23.
//

import Foundation

class DataService {
    
     func getLocalData() -> [Recipe] {
        
        //Parse the json file
        
        
        //Get a url path to the json file
         let pathString = Bundle.main.path(forResource: "recipes" , ofType: "json")
        
        //Check if pathString is not nil,otherwise...
        //Making sure something is true before go forward
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //Create a data object
            let data = try Data(contentsOf: url)
            
            
            //Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do{
                //Because we are passing a type as a parameter we are going to write .self to refer that datatype
                //Now it's going to try to decode that data into an array of recipes
              let recipeData = try decoder.decode([Recipe].self, from: data)
                 
                //Add the unique IDs
                for r in recipeData {

                    r.id = UUID()
                }
                
                //Return the recipes
                return recipeData
            }
            catch {
                //Error with parsing JSON
                print(error)
            }
        }
        catch {
            //Error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
