//
//  RegistrationViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 14/01/2025.
//

import Foundation
import SwiftUI


@Observable
class RegistrationViewModel{
    var email = ""
    var password = ""
    var name = ""
    var username = ""
    var repeatedPassword = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, fullname: name, username: username)
    }
    
    func isInputValid() -> Bool {
        password.count > 6 && username.trimmingCharacters(in: .whitespacesAndNewlines).count > 3 && email.trimmingCharacters(in: .whitespacesAndNewlines).count > 6 && name.trimmingCharacters(in: .whitespacesAndNewlines).count >= 1 && repeatedPassword == password
    }
}
