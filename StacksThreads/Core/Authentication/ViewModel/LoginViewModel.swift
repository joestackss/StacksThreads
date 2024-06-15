//
//  LoginViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 15/06/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func loginUser() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
