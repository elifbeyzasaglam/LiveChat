//
//  FirestoreManager.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 24.05.2024.
//

import Foundation
import FirebaseFirestore

final class FirestoreManager {
    static let shared = FirestoreManager()
    private let db = Firestore.firestore()
    private init() { }
    
    func searchRoom(with firstId: String, secondId: String) {
        let docRef = db.collection("messages").document(compareUUID(firstId: firstId, secondId: secondId))

        docRef.getDocument(as: String.self) { result in

            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                docRef.setData(["message":"slm"])
            }
       }
    }
    
    private func compareUUID(firstId: String, secondId: String) -> String {
        if firstId < secondId {
            return "\(firstId)_\(secondId)"
        } else if firstId > secondId {
            return "\(secondId)_\(firstId)"
        } else {
            return "\(firstId)_\(secondId)"
        }
    }
}
