//
//  AuthManager.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 1.04.2024.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    
    func signUp(mail: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        Auth.auth().createUser(withEmail: mail, password: password) { result, error in
            if let error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            }
        }
    }
    
    func signIn(mail: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        Auth.auth().signIn(withEmail: mail, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            }
        }
    }
    
    func logout(completion: () -> ()) {
        do {
            try Auth.auth().signOut()
            completion()
            
        } catch {
            print(error)
        }
    }
}
