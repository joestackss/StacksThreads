//
//  FeedView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
       
        
        NavigationStack {
           
                VStack(content: {
                    Image("threadslogodark")
                    
                    Spacer()
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(1...10, id: \.self) {
                            _ in
                            
                            LazyVStack {
                                FeedCell()
                            }
                        }
                    }
                })
        }
        .refreshable {
            print("Refresh Done")
        }
    }
}

#Preview {
    FeedView()
}
