//
//  HomeView.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 04/06/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var contentModel = ContentModel()
    @State private var searchText = ""
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.sneakers.count != 0 {
            VStack (alignment: .leading){
                HStack{
                    TextField("Search", text: $searchText)
                        .padding(.horizontal)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                Divider()
                CollectionsView()
            }
        }
        
        else {
            ProgressView()
        }
        
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
