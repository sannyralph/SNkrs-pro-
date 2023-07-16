//
//  Sneakers.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 12/07/2023.
//

import Foundation

struct Sneakers: Decodable {
    
    var id: String?
    var brand: String?
    var name: String?
    var releaseYear: String?
    var retailPrice: Int?
    var estimatedMarketValue: Int?
    var image: Images?
    var links: link?
}

struct Images: Decodable {
    var original: String?
    var small: String?
    var thumbnail: String?
}

struct link: Decodable {
    var stockX: String?
    var goat: String?
    var flightClub: String?
    var stadiumGoods: String?
}
