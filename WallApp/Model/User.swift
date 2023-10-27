//
//  User.swift
//  WallApp
//
//  Created by Luis Miguel Valdes Napoles on 10/17/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageURL: String?
    var fullname: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentID = Auth.auth().currentUser?.uid else { return false }
        return currentID == id
    }
}

extension User {
    static var MockUsers: [User] = [
        .init(id: NSUUID().uuidString, username: "EL PEPE",profileImageURL: nil, fullname: "Pepe", email: "pepe@gmail.com"),
        .init(id: NSUUID().uuidString, username: "LA LOLA",profileImageURL: nil, fullname: nil, email: "lola@gmail.com"),
        .init(id: NSUUID().uuidString, username: "EL COCO",profileImageURL: nil, fullname: "Coco", email: "coco@gmail.com"),
        .init(id: NSUUID().uuidString, username: "EL NENE",profileImageURL: nil, fullname: "Nene", email: "nene@gmail.com"),
    ]
}

