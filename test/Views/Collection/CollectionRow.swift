//
//  CollectionRow.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 23/07/2023.
//

import SwiftUI

struct CollectionRow: View {
    
    @ObservedObject var sneaker: Sneakers
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack{
                
                let uiImage = UIImage(data: sneaker.ImageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
               
                    VStack(alignment: .leading){
                        Text(sneaker.brand ?? "")
                            .bold()
                        Text(sneaker.name ?? "")
                            .font(.caption)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text(String(sneaker.retailPrice ?? 0))
                            .bold()
                    }
                Divider()
            }
            
        }
    }
    
}
