//
//  ActivityButton.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 14/06/2024.
//

//
//  CustomButton.swift
//  StackSearch
//
//  Created by Popoola Joseph Olamide on 11/06/2024.
//

import SwiftUI

struct ActivityButton: View {
    let title: String
    let action: () -> Void
    let isSelected: Bool
    let primaryColor: Color
    let secondaryColor: Color
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .foregroundStyle(isSelected ? Color.white : Color.gray)
                .fontWeight(isSelected ? .medium : .regular)
                .padding(10)
                .padding(.horizontal, 30)
                .background(isSelected ? primaryColor : secondaryColor)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: isSelected ?  0 : 1.0))
        }
    }
}

#Preview {
    ActivityButton(title: "All", action: {}, isSelected: true, primaryColor: .black, secondaryColor: .white)
}

