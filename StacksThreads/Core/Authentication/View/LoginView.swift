//
//  LoginView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                // logo image
                Image("threads-app-icon")
                    .renderingMode(.template)
                    .resizable()
                    .colorMultiply(Color.theme.primaryText)
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                // text fields
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    if let emailError = viewModel.loginEmailError {
                        Text(emailError).foregroundColor(.red).font(.footnote)
                    }
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                    if let passwordError = viewModel.loginPasswordError {
                        Text(passwordError).foregroundColor(.red).font(.footnote)
                    }
                }
                
                NavigationLink {
                    ForgotPasswordView()
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .foregroundColor(Color.theme.primaryText)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                if viewModel.isLoginLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.primaryText))
                        .padding()
                }
                
                Button {
                    Task { try await viewModel.login() }
                } label: {
                    Text("Login")
                        .foregroundColor(Color.theme.primaryBackground)
                        .modifier(ThreadsButtonModifier())
                }

                .padding(.vertical)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.theme.primaryText)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
            .alert(isPresented: .constant(viewModel.loginErrorMessage != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.loginErrorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("OK")) {
                        viewModel.loginErrorMessage = nil
                    }
                )
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
