//
//  ProfileView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedThreadFilter: ProfileThreadFilterViewModel = .threads
    @State private var showEditProfile = false 
    @StateObject var viewModel: UserProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserProfileViewModel(user: user))
    }
    
    private var user: User {
        return viewModel.user
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(user.username)
                                .font(.subheadline)
                        }
                        
                        if let bio = user.bio {
                            Text(bio)
                                .font(.footnote)
                        }
                        
                        Button {
                        } label: {
                            Text("12 followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }

                    }
                    
                    Spacer()
                    
                    CircularProfileImageView(user: user, size: .medium)
                }
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.primaryBackground)
                        .frame(width: 352, height: 32)
                        .background(Color.theme.primaryText)
                        .cornerRadius(8)
                }
                
                UserContentListView(
                    selectedFilter: $selectedThreadFilter,
                    user: user
                )
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
