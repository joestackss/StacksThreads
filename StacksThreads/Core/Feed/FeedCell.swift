//
//  FeedCell.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, content: {
                AvatarView()
                
                VStack (alignment: .leading, spacing: 10, content: {
                    
    //                Username and Time
                    HStack {
                        Text("Joseph Stacks")
                            .font(.system(size: 18, weight: .semibold))
                        
                        
                        Spacer()
                        
                        HStack(alignment: .center, spacing: 10, content: {
                            Text("49m")
                                .font(.system(size: 15))
                                .foregroundStyle(Color.gray)
                            Image(systemName: "ellipsis")
                        })
                        
                    }
                    
    //                Tweet
                    Text("Failures are stepping stones to success. Embrace them, learn from them, and keep moving forward")
                    
    //                Icons
                    HStack(content: {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "heart")
                                .foregroundStyle(Color.primary)
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "bubble.right")
                                .foregroundStyle(Color.primary)
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "arrow.2.squarepath")
                                .foregroundStyle(Color.primary)
                        })
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "paperplane")
                                .foregroundStyle(Color.primary)
                        })
                    })
                    
                })
                
                
            })
            .padding()
            
            Divider()
        }
    }
}

#Preview {
    FeedCell()
}

struct AvatarView: View {
    var body: some View {
        Image("avatar")
            .resizable()
            .scaledToFit()
            .frame(width: 50)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}
