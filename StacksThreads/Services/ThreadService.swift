//
//  ThreadService.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//
import Foundation
import FirebaseFirestoreSwift
import Firebase

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        let ref = try await FirestoreConstants.ThreadsCollection.addDocument(data: threadData)
        try await updateUserFeedsAfterPost(threadId: ref.documentID)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await FirestoreConstants
            .ThreadsCollection
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let query = FirestoreConstants.ThreadsCollection.whereField("ownerUid", isEqualTo: uid)
        let snapshot = try await query.getDocuments()
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
    
    static func fetchThread(threadId: String) async throws -> Thread {
        let snapshot = try await FirestoreConstants.ThreadsCollection.document(threadId).getDocument()
        let thread = try snapshot.data(as: Thread.self)
        return thread
    }
}

// MARK: - Likes

extension ThreadService {
    static func likeThread(_ thread: Thread) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirestoreConstants.ThreadsCollection.document(thread.id).collection("thread-likes").document(uid).setData([:])
        async let _ = try await FirestoreConstants.ThreadsCollection.document(thread.id).updateData(["likes": thread.likes + 1])
        async let _ = try await FirestoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).setData([:])
    }
    
    static func unlikeThread(_ thread: Thread) async throws {
        guard thread.likes > 0 else { return }
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirestoreConstants.ThreadsCollection.document(thread.id).collection("thread-likes").document(uid).delete()
        async let _ = try await FirestoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).delete()
        async let _ = try await FirestoreConstants.ThreadsCollection.document(thread.id).updateData(["likes": thread.likes - 1])
    }
    
    static func checkIfUserLikedThread(_ thread: Thread) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirestoreConstants.UserCollection.document(uid).collection("user-likes").document(thread.id).getDocument()
        return snapshot.exists
    }
}

// MARK: - Feed Updates

extension ThreadService {
    private static func updateUserFeedsAfterPost(threadId: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let followersSnapshot = try await FirestoreConstants.FollowersCollection.document(uid).collection("user-followers").getDocuments()
        
        for document in followersSnapshot.documents {
            try await FirestoreConstants
                .UserCollection
                .document(document.documentID)
                .collection("user-feed")
                .document(threadId).setData([:])
        }
        
        try await FirestoreConstants.UserCollection.document(uid).collection("user-feed").document(threadId).setData([:])
    }
}
