//
//  ContentView.swift
//  test
//
//  Created by SANNI ABDULRAFIU on 31/05/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
    
        TabView {
            
            HomeView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            SearchView()
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            PostView()
                .tabItem {
                    VStack{
                        Image(systemName: "plus.app")
                        Text("Post")
                    }
                }
          
            ProfileView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    
                    }
                }
            MessageView()
                .tabItem {
                    VStack{
                        Image(systemName: "message")
                        Text("Chats")
                    }
                }
        }
       
    }
}

struct ManiView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
