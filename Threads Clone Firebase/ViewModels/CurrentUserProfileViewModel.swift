//
//  ProfileViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 15/01/2025.
//

import Foundation
import Combine

@Observable
class CurrentUserProfileViewModel {
    var currentUser: User?
    var showingSheet = false
    var refresh = false
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
