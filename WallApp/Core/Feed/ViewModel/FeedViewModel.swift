//
//  FeedViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/26/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        //self.posts = try await PostService.fetchFeedPost()
    }
}
