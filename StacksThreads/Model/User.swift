//
//  User.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import FirebaseFirestoreSwift
import Firebase
import Foundation

struct User: Identifiable, Codable {
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
    var link: String?
    let id: String
    
    var isCurrentUser: Bool {
        return id == Auth.auth().currentUser?.uid
    }
}

extension User: Hashable {
    var identifier: String { return id }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
