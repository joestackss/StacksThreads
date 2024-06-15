//
//  ActivityView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct ActivityView: View {
    @State private var category = "all"
    var body: some View {
        NavigationStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10, content: {
                    
                    //                All
                    ActivityButton(
                        title: "All",
                        action: { category = "all" },
                        isSelected: category == "all",
                        primaryColor: .primary,
                        secondaryColor: .white
                    )
                    
//                    Replies
                    ActivityButton(
                        title: "Replies",
                        action: { category = "replies" },
                        isSelected: category == "replies",
                        primaryColor: .primary,
                        secondaryColor: .white
                    )
                    
//                    Mentions
                    ActivityButton(
                        title: "Mentions",
                        action: { category = "mentions" },
                        isSelected: category == "mentions",
                        primaryColor: .primary,
                        secondaryColor: .white
                    )

                })
                .padding(.vertical)
                .padding(.leading, 20)
            }
        
            ScrollView(showsIndicators: false) {
                ForEach(1...10, id: \.self) {
                    _ in
                    
                    LazyVStack {
                        ActivityCell()
                    }
                }
            }
            
            .navigationTitle("Activity")
            
        }
    }
}

#Preview {
    ActivityView()
}
