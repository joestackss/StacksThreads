//
//  RegistrationViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import FirebaseAuth

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    @Published var isLoading = false
    
    @MainActor
    func createUser() async throws {
        isLoading = true
        defer { isLoading = false }
                
        do {
            try await AuthService.shared.createUser(
                withEmail: email,
                password: password,
                fullname: fullname,
                username: username
            )
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
}
