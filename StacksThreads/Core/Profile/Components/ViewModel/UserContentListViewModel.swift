//
//  UserContentListViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Foundation

@MainActor
class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    private let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    func fetchUserThreads() async throws {
        var userThreads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< userThreads.count {
            userThreads[i].user = self.user
        }
        self.threads = userThreads
    }
}
