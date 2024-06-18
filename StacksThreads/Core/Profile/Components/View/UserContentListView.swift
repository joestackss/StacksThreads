//
//  UserContentListView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct UserContentListView: View {
    @Binding var selectedFilter: ProfileThreadFilterViewModel
    @StateObject var viewModel: UserContentListViewModel
    @Namespace var animation
    
    init(selectedFilter: Binding<ProfileThreadFilterViewModel>, user: User) {
        self._selectedFilter = selectedFilter
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilterViewModel.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilterViewModel.allCases) { option in
                    VStack {
                        Text(option.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == option ? .semibold : .regular)
                        
                        if selectedFilter == option {
                            Rectangle()
                                .foregroundStyle(Color.theme.primaryText)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = option
                        }
                    }
                }
            }
            .padding(.vertical, 4)
            
            LazyVStack {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
            
            .padding(.vertical, 8)
        }
    }
}

struct UserContentListView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentListView(
            selectedFilter: .constant(.threads),
            user: dev.user
        )
    }
}
