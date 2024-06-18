//
//  LoginViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        
        do {
            try await AuthService.shared.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
}
