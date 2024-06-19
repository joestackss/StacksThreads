//
//  CurrentUserProfileViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Foundation
import Combine
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class CurrentUserProfileViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var currentUser: User? {
        didSet {
            if let user = currentUser {
                bio = user.bio ?? ""
                link = user.link ?? ""
            }
        }
    }
    @Published var profileImage: Image?
    @Published var bio = ""
    @Published var link = ""
    
    
    @Published var bioUserDataError: String? = nil
    @Published var linkUserDataError: String? = nil
    
    
    @Published var isUpdateUserDataLoading = false
    @Published var updateUserErrorMessage: String? = nil
    
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    private var uiImage: UIImage?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
        
    init() {
        setupSubcribers()
    }
}

// MARK: - User Data

extension CurrentUserProfileViewModel {
    
    func updateUserData() async throws {
        isUpdateUserDataLoading = true
        defer { isUpdateUserDataLoading = false }
        
        guard let user = currentUser else { return }
        var data: [String: String] = [:]
        
        if !bio.isEmpty, user.bio ?? "" != bio {
            currentUser?.bio = bio
            data["bio"] = bio
        }
        
        if !link.isEmpty, currentUser?.link ?? "" != link {
            currentUser?.link = link
            data["link"] = link
        }
        
        if let uiImage = uiImage {
            try await updateProfileImage(uiImage)
            data["profileImageUrl"] = currentUser?.profileImageUrl
        }
        do {
            try await FirestoreConstants.UserCollection.document(user.id).updateData(data)
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            
            updateUserErrorMessage = error.localizedDescription
        }
        
    }
}

// MARK: - Subscribers

extension CurrentUserProfileViewModel {
    private func setupSubcribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}

// MARK: - Image Loading

extension CurrentUserProfileViewModel {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateProfileImage(_ uiImage: UIImage) async throws {
        let imageUrl = try? await ImageUploader.uploadImage(image: uiImage, type: .profile)
        currentUser?.profileImageUrl = imageUrl
    }
}
