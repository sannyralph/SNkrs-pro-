//
//  CollectionsView.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 20/06/2023.
//

import SwiftUI

struct CollectionsView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var searchText: String = ""

    
    var body: some View {
        ScrollView {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]){
                CollectionSection(title: "My collection", sneakers: model.sneakers)
                
            }
        }
    }
    
    struct CollectionsView_Previews: PreviewProvider {
        static var previews: some View {
            CollectionsView()
        }
    }
}
