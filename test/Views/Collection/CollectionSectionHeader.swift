//
//  CollectionSectionHeader.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 22/07/2023.
//

import SwiftUI



struct CollectionSectionHeader: View {
    
    @EnvironmentObject var model: ContentModel
    var title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }
    }
}

struct CollectionSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollectionSectionHeader(title: "My Collecttion")
    }
}
