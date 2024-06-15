//
//  SearchView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchquery: String = ""
    
    var body: some View {
        
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach(1...10, id: \.self) {
                    _ in
                    
                    LazyVStack {
                        ProfileCell()
                    }
                }
            }
            
            .navigationTitle("Search")
            .searchable(text: $searchquery)
        }
        
     
        
    }
}

#Preview {
    SearchView()
}
