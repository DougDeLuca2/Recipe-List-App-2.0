//
//  Recipe.swift
//  Recipe List App
//
//  Created by User on 6/7/23.
//

import Foundation

//Identifiable lets it work inside a Swift UI list so it can tell each ingredient apart and Decodable lets us easily decode that JSON data with the decodeable protocol
class Recipe:Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredients]
    var directions:[String]
}


class Ingredients: Identifiable, Decodable {
    
    //Since we have Identifiable as a protocol we need a UUID property
    var id:UUID?
    var name:String
    //This are optionals because they might or might not exist.
    var num:Int?
    var demon:Int?
    var unit:String?
}
