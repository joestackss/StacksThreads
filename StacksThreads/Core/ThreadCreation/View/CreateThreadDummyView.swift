//
//  CreateThreadDummyView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct CreateThreadDummyView: View {
    @State private var presented = false
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack { }
        .onAppear { presented = true }
        .sheet(isPresented: $presented) {
            CreateThreadView(tabIndex: $tabIndex)
        }
    }
}

struct CreateThreadDummyView_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadDummyView(tabIndex: .constant(0))
    }
}
