//
//  ProfileViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Foundation

@MainActor
class UserProfileViewModel: ObservableObject {
    @Published var threads = [Thread]()
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
