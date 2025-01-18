//
//  AuthService.swift
//  Threads Clone Firebase
//
//  Created by Andrii Pashuta on 14/01/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    
    @MainActor
    func createUser(email: String, password: String, fullname: String, username: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(email: email, fullname: fullname, username: username, id: result.user.uid)
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func logOut() {
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.resetUser()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func uploadUserData(email: String, fullname: String, username: String, id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
}
