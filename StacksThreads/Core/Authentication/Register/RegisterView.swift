//
//  RegisterView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RegistrationViewModel()
    
    
    var body: some View {
        ZStack(alignment: .center) {
            
            
            VStack(content: {
                Text("English(US)")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 20))
                
                Spacer()
                
                Image("instagramlogo")
                
                Spacer()
                
//                Login Form
                VStack(spacing: 20, content: {
                    
                    TextField("Email ", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.vertical, 2)
                        .foregroundStyle(Color.gray)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .padding(.vertical, 2)
                        .foregroundStyle(Color.gray)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                    
                    TextField("Full name", text: $viewModel.fullname)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.vertical, 2)
                        .foregroundStyle(Color.gray)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                    
                    TextField("Username", text: $viewModel.username)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.vertical, 2)
                        .foregroundStyle(Color.gray)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                    
                    Button(action: {
                        Task { try await viewModel.createUser() }
                    }, label: {
                        Text("Register")
                            .foregroundStyle(Color.white)
                            .padding(20)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.myblue)
                            .clipShape(RoundedRectangle(cornerRadius: 30.0))
                    })
                    
                    HStack(content: {
                        Text("Have an account?")
                        
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Sign in")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        })
                       
                    })
                    .font(.system(size: 20))
                })
                
                Spacer()
                
                
//                Meta Logo
                Image("metalogo")
            })
            .padding()
        }
       
    }
}

#Preview {
    RegisterView()
}
