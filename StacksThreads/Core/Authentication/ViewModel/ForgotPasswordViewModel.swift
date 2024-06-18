//
//  ForgotPasswordViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Foundation

@MainActor
class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    
    func sendPasswordResetEmail() async throws {
        try await AuthService.shared.sendPasswordResetEmail(toEmail: email)
    }
}
