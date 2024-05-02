//
//  RealtimeDatabaseManager.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 14.04.2024.
//

import Foundation
import FirebaseDatabase

final class RealtimeDatabaseManager {
    static let shared = RealtimeDatabaseManager()
    
    private init() { }
    
    func saveUser(with model: UserModel, authId: String, completion: () -> ()) {
        let ref = Database.database().reference()
        do {
            try ref.child("users").child(authId).setValue(from: model)
            completion()
        } catch {
            print(error)
        }
    }
}
