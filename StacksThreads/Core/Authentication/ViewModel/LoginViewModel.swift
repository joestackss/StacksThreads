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
    
    @Published var isLoginLoading = false
    @Published var loginErrorMessage: String? = nil
    
    @Published var loginEmailError: String? = nil
    @Published var loginPasswordError: String? = nil
    
    @MainActor
    func login() async throws {
        
        isLoginLoading = true
        defer { isLoginLoading = false }
        
        guard validate() else { return }
       
        
        do {
            try await AuthService.shared.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            loginErrorMessage = error.localizedDescription
        }
    }
    
    private func validate() -> Bool {
        var isValid = true
        
        if email.isEmpty || !isValidEmail(email) {
            loginEmailError = "Please enter a valid email address."
            isValid = false
        } else {
            loginEmailError = nil
        }
        
        if password.isEmpty || password.count < 6 {
            loginPasswordError = "Password must be at least 6 characters."
            isValid = false
        } else {
            loginPasswordError = nil
        }
        
        return isValid
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
