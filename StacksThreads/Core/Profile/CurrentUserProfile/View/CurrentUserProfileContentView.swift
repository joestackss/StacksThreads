//
//  CurrentUserProfileContentView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct CurrentUserProfileContentView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel() 
    @State private var selectedThreadFilter: ProfileThreadFilterViewModel = .threads
    @State private var showEditProfile = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Spacer()
                
                Button {
                    AuthService.shared.signOut()
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(Color.theme.primaryText)
                }
            }
            .padding(.bottom)
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user?.fullname ?? "")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(user?.username ?? "")
                                .font(.subheadline)
                        }
                        
                        if let bio = user?.bio {
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
                
                HStack {
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .foregroundStyle(Color.theme.primaryText)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 175, height: 32)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Share Profile")
                            .foregroundStyle(Color.theme.primaryText)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 175, height: 32)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                }
                
                if let user = user {
                    UserContentListView(selectedFilter: $selectedThreadFilter, user: user)
                }
            }
        }
        .sheet(isPresented: $showEditProfile, content: {
            EditProfileView()
                .environmentObject(viewModel)
        })
    }
}

struct CurrentUserProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileContentView()
    }
}
