//
//  ProfileThreadFilterViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 17/01/2025.
//

import Foundation

@Observable
class ProfileThreadFilterViewModel {
    var threads = [Thread]()
    let user: User
    
    init(user: User){
        self.user = user
        Task {
            try await fetchUserThreads()
        }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
}
