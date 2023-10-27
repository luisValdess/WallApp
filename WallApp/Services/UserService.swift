//
//  UserService.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/17/23.
//

import Foundation
import Firebase

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await FirebaseConstants
            .UsersCollection
            .document(uid)
            .getDocument(as: User.self)
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await FirebaseConstants.UsersCollection.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
//    static func fetchUsers(forConfig config: UserListConfig) async throws -> [User] {
//        switch config {
//        case .followers(let uid):
//            return try await fetchFollowers(uid: uid)
//        case .following(let uid):
//            return try await fetchFollowing(uid: uid)
//        case .likes(let postId):
//            return try await fetchPostLikesUsers(uid: postId)
//        case .explore:
//            return try await fetchAllUsers()
//        }
//    }
    
//    private static func fetchPostLikesUsers(uid: String) async throws -> [User] {
//        return []
//    }
    
    private static func fetchUsers(_ snapshot: QuerySnapshot) async throws -> [User] {
        var users = [User]()
        
        for doc in snapshot.documents {
            users.append(try await fetchUser(withUid: doc.documentID))
        }
        
        return users
    }
    
}
