//
//  ProfileViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/29/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    func handleProfileButton() {
        if (user != nil) {
            signOut()
        } else {
            backToStart()
        }
    }
    
    private func backToStart() {
        GuestService.shared.setGuestDefault()
    }
    
    private func signOut() {
        AuthService.shared.signOut()
        GuestService.shared.setGuestDefault()
    }
}
