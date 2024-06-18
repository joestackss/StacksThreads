//
//  ExploreView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                UserListView(viewModel: viewModel)
                    .navigationDestination(for: User.self) { user in
                        ProfileView(user: user)
                    }
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
