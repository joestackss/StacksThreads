//
//  WelcomeView.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 13/06/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        VStack(content: {
            Image("threadspattern")
            
            Spacer()
            
            
            HStack(content: {
                VStack(alignment: .leading, content: {
                    Text("Log in with instagram")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.gray)
                    Text("joestackss__")
                        .font(.system(size: 23, weight: .semibold))
                })
                
                Spacer()
                
                Image("solidinstagram")
            })
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
            .padding()
               
          
            
            Spacer()
            
        }).ignoresSafeArea()
        
        
    }
}

#Preview {
    WelcomeView()
}
