//
//  FeedViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 17/01/2025.
//

import Foundation

@Observable @MainActor
class FeedViewModel {
    var threads = [Thread]()
    
    init(){
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchThreadUserData()
    }
    
    private func fetchThreadUserData() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            
            threads[i].user = threadUser
        }
    }
}

