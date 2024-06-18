//
//  ContentView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                ThreadsTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
