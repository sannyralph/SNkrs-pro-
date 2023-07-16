//
//  HomeView.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 04/06/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var hovered = false
    
    var body: some View {
        NavigationStack {
            
            HStack {
    
                Spacer()
                NavigationLink(destination: CollectorsView()) {
                                    Text("Collectors")
                                    .padding(5)
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .background(Color.black)
                                    .cornerRadius(30)
                                    
    
                           }
                
               
                Spacer()
                NavigationLink(destination: SwapView()){
                                   Text("Swap")
                                    .padding(5)
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .background(Color.black)
                                    .cornerRadius(30)
                           }
                Spacer()
                NavigationLink(destination: CollectionsView()) {
                                    Text("Collections")
                                    .padding(5)
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .background(Color.black)
                                    .cornerRadius(30)
                           }
                Spacer()
                
            }
            
            
            Spacer()
            HStack {
                Image("unnamed")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            
            
        }
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
