//
//  CollectionSection.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 22/07/2023.
//

import SwiftUI

struct CollectionSection: View {
    
    var title: String
    var sneakers: [Sneakers]
    
    var body: some View {
        Section (header: CollectionSectionHeader(title: title)){
            ForEach(sneakers) { sneaker in
                CollectionRow(sneaker: sneaker)
            }
        }
    }
}

