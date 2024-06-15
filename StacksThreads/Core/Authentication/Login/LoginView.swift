//
//  LoginView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 13/06/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var navigate = false
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationStack {
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
                        
                        TextField("Email", text: $viewModel.email)
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
                        
                        Button(action: {
                            Task {
                                try await viewModel.loginUser()
                            }
                        }, label: {
                            Text("Log in")
                                .foregroundStyle(Color.white)
                                .padding(20)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .background(Color.myblue)
                                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                        })
                        
                        HStack(content: {
                            Text("No account yet?")
                            
                            Button(action: {
                                navigate = true
                            }, label: {
                                Text("Sign Up")
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
            .navigationDestination(isPresented: $navigate) {
                RegisterView()
                    .navigationBarBackButtonHidden(true)
            }
            
        }
        
       
    }
}

#Preview {
    LoginView()
}
