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
    @Published var errorMessage: String? = nil
    
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    @Published var fullnameError: String? = nil
    @Published var usernameError: String? = nil
    
    @MainActor
    func createUser() async throws {
        isLoading = true
        defer { isLoading = false }
        
        guard validate() else { return }
       
        do {
            try await AuthService.shared.createUser(
                withEmail: email,
                password: password,
                fullname: fullname,
                username: username
            )
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            errorMessage = error.localizedDescription
        }
    }
    
    private func validate() -> Bool {
            var isValid = true
            
            if email.isEmpty || !isValidEmail(email) {
                emailError = "Please enter a valid email address."
                isValid = false
            } else {
                emailError = nil
            }
            
            if password.isEmpty || password.count < 6 {
                passwordError = "Password must be at least 6 characters."
                isValid = false
            } else {
                passwordError = nil
            }
            
            if fullname.isEmpty || fullname.count < 5 {
                fullnameError = "Full name must be at least 5 characters."
                isValid = false
            } else {
                fullnameError = nil
            }
            
            if username.isEmpty || username.count < 2 {
                usernameError = "Username must be at least 2 characters."
                isValid = false
            } else {
                usernameError = nil
            }
            
            return isValid
        }
        
        private func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
}
