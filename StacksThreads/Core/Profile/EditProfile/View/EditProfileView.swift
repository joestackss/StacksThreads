//
//  EditProfileView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var isPrivateProfile = false
    @EnvironmentObject var viewModel: CurrentUserProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return viewModel.currentUser
    }
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user?.fullname ?? "")
                                .fontWeight(.semibold)
                            
                            Text(user?.username ?? "")
                        }
                        .font(.footnote)

                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedImage) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: ProfileImageSize.small.dimension, height: ProfileImageSize.small.dimension)
                                    .clipShape(Circle())
                                    .foregroundColor(Color(.systemGray4))
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter you bio..", text: $viewModel.bio, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text: $viewModel.link)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                        .font(.footnote)
                    
                    Divider()
                    
                    if viewModel.isUpdateUserDataLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.primaryText))
                            .padding()
                    }
                }
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.subheadline)
                        .foregroundColor(Color.theme.primaryText)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            Task {
                                try await viewModel.updateUserData()
                                dismiss()
                            }
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    }
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .background(Color.theme.primaryBackground)
                .padding()
            }
            .alert(isPresented: .constant(viewModel.updateUserErrorMessage != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.updateUserErrorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("OK")) {
                        viewModel.updateUserErrorMessage = nil
                    }
                )
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
