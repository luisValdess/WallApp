//
//  MainTabView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/16/23.
//

import SwiftUI

import SwiftUI

struct MainTabView: View {
    
    let user: User
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            ProfileView(user: user)
                .tabItem {
                    Image(systemName: "person")
                }.tag(1)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView(user: User.MockUsers[0])
}
