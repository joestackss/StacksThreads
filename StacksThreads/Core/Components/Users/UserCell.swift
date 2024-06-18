//
//  UserCell.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                CircularProfileImageView(user: user, size: .small)
                
                VStack(alignment: .leading) {
                    Text(user.username)
                        .bold()
                    
                    Text(user.fullname)                    
                }
                .font(.footnote)
                
                Spacer()
                
                if !user.isCurrentUser {
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .foregroundStyle(Color.theme.primaryText)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 32)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                }

            }
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.vertical, 4)
        .foregroundColor(Color.theme.primaryText)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
