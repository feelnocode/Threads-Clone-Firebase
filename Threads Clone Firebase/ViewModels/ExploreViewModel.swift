//
//  ExploreViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 15/01/2025.
//

import Foundation

@Observable

class ExploreViewModel {
    var users = [User]()
    
    init(){
        Task{
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
