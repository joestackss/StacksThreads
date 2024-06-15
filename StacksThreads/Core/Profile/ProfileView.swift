//
//  ProfileView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        
        VStack (alignment: .leading, content: {
//            World Icon and IG Icon
            HStack(content: {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.leading, 10)
                
                Spacer()
                
                 
                HStack(content: {
                    Image("instagramoutline")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45)
                    
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                })
                
                
            })
            .padding(.bottom, 10)
            
            
//            Profile Info
            HStack {
                    VStack(alignment: .leading, content: {
                        Text("Joseph Stack")
                            .font(.system(size: 30, weight: .semibold))
                        
                        HStack(alignment: .center, content: {
                            Text("joestacks")
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("threads.net")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(Color.gray)
                                .padding(8)
                                .padding(.horizontal, 13)
                                .background(Color.lightgray)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        })
                        
                        Text("Curious to learn something \nunique or challenging")
                            .font(.system(size: 18, weight: .regular))
                        
                        HStack(spacing: 5, content: {
                            Text("23")
                            Text("followers")
                        })
                        .foregroundStyle(Color.gray)
                        
                    
                        
                    })
                  
                    
                    Spacer()
                    
                    AvatarView()
                   
            }
           
//            Edit Profile and Share Profile
            HStack(content: {
                
                Button(action: {
                    
                }, label: {
                    Text("Edit profile")
                        .foregroundStyle(Color.black)
                        .padding(.vertical, 8)
                        .frame(width: 170)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Share profile")
                        .foregroundStyle(Color.black)
                        .padding(.vertical, 8)
                        .frame(width: 170)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                })
            })
            
            HStack {
                ForEach(ProfileThreadFilter.allCases) {
                    
                    filter in
                    
                    VStack {
                        Text(filter.title)
                            .font(.system(size: 20))
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: filterBarWidth, height: 1)
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture{
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                    
                }
            }
            .padding(.vertical, 15)
            if ( selectedFilter == .threads ) {
                ScrollView(showsIndicators: false) {
                    ForEach(1...10, id: \.self) {
                        _ in
                        
                        LazyVStack {
                            FeedCell()
                        }
                    }
                }
            } else if ( selectedFilter == .replies) {
                Text("Replies")
            }
            
           
             
            
            Spacer()
        })
        .padding(.horizontal)
        
    }
}

#Preview {
    ProfileView()
}
