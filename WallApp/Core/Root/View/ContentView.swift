//
//  ContentView.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if (viewModel.isGuest != true) && ((viewModel.currentUser) == nil)  {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
