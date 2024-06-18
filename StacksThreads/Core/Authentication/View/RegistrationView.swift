//
//  RegistrationView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.primaryText))
                    .padding()
            }
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign up")
                    .foregroundColor(Color.theme.primaryBackground)
                    .modifier(ThreadsButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .foregroundColor(Color.theme.primaryText)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
