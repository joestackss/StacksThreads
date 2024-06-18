//
//  ThreadsButtonModifier.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct ThreadsButtonModifier: ViewModifier {
    let buttonHeight: CGFloat
    let backgroundColor: Color
    
    init(buttonHeight: CGFloat = 44, backgroundColor: Color = .black) {
        self.buttonHeight = buttonHeight
        self.backgroundColor = backgroundColor
    }
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 352, height: buttonHeight)
            .background(Color.theme.primaryText)
            .cornerRadius(8)
    }
}

struct ButtonWithBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 352, height: 32)
            .background(.white)
            .cornerRadius(8)
    }
}
