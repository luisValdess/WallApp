//
//  GuestOptionViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/30/23.
//

import Foundation

class GuestOptionViewModel: ObservableObject {
    
    func pendingStatus() -> Bool {
        if GuestService.shared.isGuest != true {
            true
        } else {
            false
        }
    }
    
    func setGuest() {
        GuestService.shared.setGuestTrue()
    }
    
    func setNoGuest() {
        GuestService.shared.setGuestFalse()
    }
}
