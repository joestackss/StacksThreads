//
//  PreviewProvider.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 16/06/2024.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var thread = Thread(
        ownerUid: NSUUID().uuidString,
        caption: "Here's to the crazy ones. The misfits. The rebels",
        timestamp: Timestamp(),
        likes: 247,
        imageUrl: "lewis-hamilton",
        replyCount: 67,
        user: User(
            fullname: "Lewis Hamilton",
            email: "lewis-hamilton@gmail.com",
            username: "lewis-hamilton",
            profileImageUrl: nil,
            id: NSUUID().uuidString
        )
    )
    
    var user = User(
        fullname: "Daniel Ricciardo",
        email: "daniel@gmail.com",
        username: "daniel-ricciardo",
        profileImageUrl: nil,
        id: NSUUID().uuidString
    )
}
