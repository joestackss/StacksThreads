//
//  UserService.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 15/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()

    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await FirestoreConstants.UserCollection.document(uid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await FirestoreConstants.UserCollection.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    

    static func fetchUsers() async throws -> [User] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await FirestoreConstants.UserCollection.getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter({ $0.id != uid })
    }
}
