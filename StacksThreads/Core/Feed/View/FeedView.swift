//
//  FeedView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                    .padding(.top)
                }
            }
            .refreshable {
                Task { try await viewModel.fetchThreads() }
            }
            .overlay {
                if viewModel.isLoading { ProgressView() }
            }
            .navigationDestination(for: User.self, destination: { user in
                if user.isCurrentUser {
                    CurrentUserProfileView(didNavigate: true)
                } else {
                    ProfileView(user: user)
                }
            })
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { try await viewModel.fetchThreads() }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(Color.theme.primaryText)
                    }

                }
            }
            .padding([.top, .horizontal])
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
