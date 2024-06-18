//
//  ContentActionButtonView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct ContentActionButtonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(Color.theme.primaryText)
                }
                
                Button {
                    print("DEBUG: Show reply sheet here..")
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.rectanglepath")
                        .resizable()
                        .frame(width: 18, height: 16)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.small)
                }

            }
            .foregroundStyle(Color.theme.primaryText)
        }
    }
}

struct ContentActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentActionButtonView()
    }
}
