//
//  ContentViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 15/01/2025.
//

import Foundation
import Combine
import FirebaseAuth

@Observable
class ContentViewModel{
    var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)

    }
}
