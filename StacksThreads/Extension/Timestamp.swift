//
//  Timestamp.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//
import Firebase
import Foundation

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
