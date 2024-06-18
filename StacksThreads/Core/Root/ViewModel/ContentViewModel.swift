//
//  ContentViewModel.swift
//  StacksThreads
//
//  Created by Popoola Joseph Olamide on 17/06/2024.
//

import Combine
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] session in
            self?.userSession = session
        }.store(in: &cancellables)
    }
}
