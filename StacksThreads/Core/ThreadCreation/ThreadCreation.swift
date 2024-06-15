//
//  ThreadCreation.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct ThreadCreation: View {
    @State private var threadText: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            
            VStack {
               
                HStack(alignment: .top, spacing: 15, content: {
                   AvatarView()
                    
                    VStack(alignment: .leading,  content: {
                        Text("Joestacks")
                            .font(.system(size: 20, weight: .semibold))
                        
                        TextField("Start a thread...", text: $threadText, axis: .vertical)
                         
                    })
                    
                    if !threadText.isEmpty {
                        
                        Button(action: {
                            threadText = ""
                            
                        }, label: {
                            Image(systemName: "xmark")
                        })
                      
                    }
                })
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                    .foregroundStyle(Color.primary)
                    .fontWeight(.semibold)
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Post")
                        
                    })
                    .opacity(!threadText.isEmpty ? 1 : 0.5)
                    .disabled(threadText.isEmpty)
                    .foregroundStyle(Color.primary)
                    .fontWeight(.bold)
                }

            }
            
        }
        
        
        
    }
}

#Preview {
    ThreadCreation()
}
