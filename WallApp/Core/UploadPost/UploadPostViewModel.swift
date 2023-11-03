//
//  UploadPostViewModel.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/28/23.
//

import Foundation
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let postRef = FirebaseConstants.PostsCollection.document()
        let post = Post(id: postRef.documentID, ownerId: uid, caption: caption, likes: 0, timestamp: Timestamp(), user: nil)
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
    
}
