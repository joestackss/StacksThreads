//
//  ExploreViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var isLoading = false
    
    init() {
        Task { try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        self.isLoading = true
        let users = try await UserService.fetchUsers()
        self.users = users
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({
            $0.fullname.lowercased().contains(lowercasedQuery) ||
            $0.username.contains(lowercasedQuery)
        })
    }
}
