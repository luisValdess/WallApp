//
//  ContentViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/17/23.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private let guestService = GuestService.shared
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isGuest: Bool?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        
        guestService.$isGuest.sink { [weak self] isGuest in
            self?.isGuest = isGuest
        }
        .store(in: &cancellables)
        
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        UserService.shared.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
       
}
