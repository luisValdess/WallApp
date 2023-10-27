//
//  Post.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/26/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerId: String
    let caption: String
    var likes: Int
    let timestamp: Timestamp
    
    var user: User?
    
    var didLike: Bool? = false
}


extension Post {
    
    static  var MockPost: [Post] = [
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", likes: 123, timestamp: Timestamp(), user: User.MockUsers[0]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", likes: 234, timestamp: Timestamp(), user: User.MockUsers[1]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", likes: 567, timestamp: Timestamp(), user: User.MockUsers[2]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", likes: 8910, timestamp: Timestamp(), user: User.MockUsers[3]),
    ]
}
