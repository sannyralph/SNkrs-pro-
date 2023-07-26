//
//  Sneakers.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 12/07/2023.
//

import Foundation

class Sneakers: Decodable, Identifiable, ObservableObject {
    
    @Published var ImageData: Data?
   
    
    var id: String?
    var brand: String?
    var name: String?
    var releaseYear: String?
    var retailPrice: Int?
    var estimatedMarketValue: Int?
    var imageUrl: Images?
    var linksUrl: Link?
    

    enum CodingKeys: String, CodingKey {
        
        case imageUrl = "image"
        case linksUrl = "links"
        
        case id
        case brand
        case name
        case releaseYear
        case retailPrice
        case estimatedMarketValue
        
    }
    
    func getImageData() {
        
        guard imageUrl?.small != nil else {
            return
        }
        
        if let url = URL(string: (imageUrl?.small)!){
            
            let session =  URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                    
                    
                    DispatchQueue.main.async {
                        self.ImageData = data!
                    }
                    
                }
            }
            dataTask.resume()
        }
    }
    
}

struct Images: Decodable {
    var original: String?
    var small: String?
    var thumbnail: String?
    
}

struct Link: Decodable {
    var stockX: String?
    var goat: String?
    var flightClub: String?
    var stadiumGoods: String?
}
