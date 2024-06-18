//
//  ForgotPasswordView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var viewModel = ForgotPasswordViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-app-icon")
                .renderingMode(.template)
                .resizable()
                .colorMultiply(Color.theme.primaryText)
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                Task { try await viewModel.sendPasswordResetEmail() }
            } label: {
                Text("Reset Password")
                    .foregroundColor(Color.theme.primaryBackground)
                    .modifier(ThreadsButtonModifier())
                    
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                Text("Return to login")
                    .foregroundColor(Color.theme.primaryText)
                    .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
