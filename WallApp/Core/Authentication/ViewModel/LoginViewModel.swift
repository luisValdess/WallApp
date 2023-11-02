//
//  LoginViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/17/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        do {
            try await AuthService.shared.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Failed to log in user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func setAsGuest() {
        GuestService.shared.setGuestTrue()
    }
}
