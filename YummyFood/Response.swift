//
//  Response.swift
//  YummyFood
//
//  Created by Tilak Basnet on 3/8/23.
//

import Foundation

class Response: Decodable {
    var count: Int
    var hits: [Hits]
    
    init(count: Int, hits: [Hits]) {
        self.count = count
        self.hits = hits
    }
}
