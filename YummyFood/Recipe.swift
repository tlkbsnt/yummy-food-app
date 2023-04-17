//
//  Recipe.swift
//  YummyFood
//
//  Created by Tilak Basnet on 3/8/23.
//

import Foundation

class Recipe: Decodable {
    
    var label: String
    var image: String
    var ingredientLines = [String] ()
    var cuisineType = [String] ()
    var yield: Float
    var totalTime: Float
    
    init (label: String, image: String, ingredientLines: [String], cuisineType: [String], yield: Float, totalTime: Float) {
        self.label = label
        self.image = image
        self.ingredientLines = ingredientLines
        self.cuisineType = cuisineType
        self.yield = yield
        self.totalTime = totalTime
    }
}
