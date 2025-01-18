//
//  User.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 15/01/2025.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}

extension User {
    static let MOCK_USER = User(id: NSUUID().uuidString, fullname: "Sebastian Mikos", email: "mikos@gmail.com", username: "mikos.seba")
}
