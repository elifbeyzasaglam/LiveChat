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
    
    func fetchUsers(completion: @escaping ([UserModel]) -> ()) {
        let ref = Database.database().reference()
        ref.child("users")
            .observe(.value) { snapshot in
                if let valueDictionary = snapshot.value as? [String: Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: valueDictionary)
                        let decoder = JSONDecoder()
                        let userDecoded = try decoder.decode([String: UserModel].self, from: jsonData)
                        print(userDecoded)
                        // TODO: GİRİŞ YAPILAN ARRAY İÇİNDEN SİLİNECEK.
                        completion(userDecoded.map({ $0.1 })) // firstIndex
                    } catch {
                        print("foo error: \(error)")
                    }
                }
            }
    }
    
    func addNewRoomIdToUser(uuid: String, selectedUserId: String, roomId: String) {
        let rootRef = Database.database().reference().ref.child("users")
        let ref = rootRef.child(uuid)
        ref.observe(.value) { snapshot, error in
            do {
                var user = try snapshot.data(as: UserModel.self)
                if !((user.chatRoomIds?.contains(roomId)) == nil) {
                    user.chatRoomIds?.append(roomId)
                    ref.setValue(user)
                }
            } catch {
                print("foo addNewRoomId err: \(error)")
            }
        }
        
        let selectedUserRef = rootRef.child(selectedUserId)
        selectedUserRef.observe(.value) { snapshot, error in
            do {
                var user = try snapshot.data(as: UserModel.self)
                if !((user.chatRoomIds?.contains(roomId)) == nil) {
                    user.chatRoomIds?.append(roomId)
                    ref.setValue(user)
                }
            } catch {
                print("foo addNewRoomId err: \(error)")
            }
        }
        
    }
}
