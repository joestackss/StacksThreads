//
//  FeedCell.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    @State private var showThreadActionSheet = false
    @State private var showSheet = false
    
    private var user: User? {
        return thread.user
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                NavigationLink(value: user) {
                    CircularProfileImageView(user: user, size: .small)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button {
                            showThreadActionSheet.toggle()
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    ContentActionButtonView()
                        .padding(.top, 12)
                }
            }

            Divider()
        }
        .foregroundColor(Color.theme.primaryText)
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
