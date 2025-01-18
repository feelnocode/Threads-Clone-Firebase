//
//  CreateThreadViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 17/01/2025.
//

import Foundation
import Firebase
import FirebaseAuth

@Observable
class CreateThreadViewModel {
    var caption = ""
    
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timeStamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
