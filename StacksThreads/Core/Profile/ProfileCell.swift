//
//  ProfileCell.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct ProfileCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10, content: {
                AvatarView()
                    
                
                VStack (alignment: .leading, spacing: 10, content: {
                    
    //                Username and Tick
                    VStack(alignment: .leading, content: {
                        HStack {
                            
                        Text("JosephStacks")
                                .font(.system(size: 18, weight: .semibold))
                            
                            
                          Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(Color.blue)
                            
                        }
                        //                Username
                                        Text("Joestacks")
                                            .foregroundStyle(Color.gray)
                                        
                    })
                    
  
    //                Icons
                    HStack(spacing: 2, content: {
                        Text("35")
                        Text("followers")
                    })
                    .fontWeight(.regular)
                    
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .foregroundStyle(Color.primary)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                })
                
            })
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
          
            
            Divider()
        }
    }
}

#Preview {
    ProfileCell()
}
