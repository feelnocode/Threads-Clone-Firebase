//
//  ThreadService.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 17/01/2025.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth


struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func deleteThread(_ threadId: String) async throws {
        try await Firestore.firestore().collection("threads").document(threadId).delete()
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timeStamp", descending: true).getDocuments()
        
        return snapshot.documents.compactMap({try? $0.data(as: Thread.self)})
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerUid", isEqualTo: uid).getDocuments()
        let threads = snapshot.documents.compactMap({try? $0.data(as: Thread.self)})
        
        return threads.sorted(by: { $0.timeStamp.dateValue() > $1.timeStamp.dateValue() } )
    }
    
}
