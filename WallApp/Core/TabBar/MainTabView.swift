//
//  MainTabView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/16/23.
//

import SwiftUI

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }.tag(1)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
