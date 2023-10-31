//
//  ProfileViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/29/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
