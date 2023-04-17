//
//  Hits.swift
//  YummyFood
//
//  Created by Tilak Basnet on 3/8/23.
//

import Foundation

class Hits: Decodable {
    var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
