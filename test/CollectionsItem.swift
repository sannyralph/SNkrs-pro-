//
//  CollectionsItem.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 20/06/2023.
//

import Foundation


struct CollectionItem:Decodable, Identifiable {
    
    var id: UUID = UUID()
    var name:String
    var price:String
    var brand: String
    
}
