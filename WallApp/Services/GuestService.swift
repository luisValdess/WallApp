//
//  GuestService.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/30/23.
//

import Foundation

class GuestService {
    
    @Published var isGuest: Bool? = nil
    
    static let shared = GuestService()
    
    func setGuestTrue() {
        isGuest = true
    }
    
    func setGuestFalse() {
        isGuest = false
    }
    
    func setGuestDefault() {
        isGuest = nil
    }
    
}
