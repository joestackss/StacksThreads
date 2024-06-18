//
//  ProfileThreadFilterViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Foundation

enum ProfileThreadFilterViewModel: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
