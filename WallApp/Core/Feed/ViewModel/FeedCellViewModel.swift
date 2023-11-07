//
//  FeedCellViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/26/23.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    @Published var user: User?
    
    init(post: Post, user: User? = nil) {
        self.post = post
        self.user = user
        Task { try await checkIfUserLikedPost() }
    }
    
    func like() async throws {
        
        do {
            let postCopy = post
            post.didLike = true
            post.likes += 1
            try await PostService.likePost(postCopy)
        } catch {
            post.didLike = false
            post.likes -= 1
        }
    }
    
    func unlike() async throws {
        do {
            let postCopy = post
            post.didLike = false
            post.likes -= 1
            try await PostService.unlikePost(postCopy)
        } catch {
            post.didLike = true
            post.likes += 1
        }
    }
    
    func checkIfUserLikedPost() async throws {
        self.post.didLike = try await PostService.checkIfUserLikedPost(post)
    }
}
