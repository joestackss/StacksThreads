//
//  ProfileThreadFilter.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 15/06/2024.
//

import Foundation


enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    
    case threads
    case replies
 
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
    
        }
    }
    
    var id: Int {return self.rawValue}
}
