//
//  Thread.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 17/01/2025.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timeStamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}

extension Thread {
    static let MOCK_THREAD = Thread(ownerUid: "666", caption: "This is a mock thread", timeStamp: Timestamp(date: Date.now), likes: 3)
}
