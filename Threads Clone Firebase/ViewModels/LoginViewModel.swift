//
//  LoginViewModel.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 15/01/2025.
//

import Foundation

@Observable
class LoginViewModel{
    var email = ""
    var password = ""
    
    
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(email: email.trimmingCharacters(in: .whitespacesAndNewlines), password: password.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    func checkValidity() -> Bool {
       email.contains("@") && password.count >= 6
    }
}
