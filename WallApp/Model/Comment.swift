//
//  Comment.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 11/6/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Codable {
    
    @DocumentID var commentId: String?
    let postOwnerId: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerId: String
    
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
    
}

extension Comment {
    
    static var comment = Comment(postOwnerId: "123", commentText: "Test comment for now", postId: "323", timestamp: Timestamp(), commentOwnerId: "1111")
    
}
