//
//  Thread.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Thread: Identifiable, Codable, Hashable {
    @DocumentID private var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var imageUrl: String?
    var replyCount: Int
    
    var user: User?
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
}

