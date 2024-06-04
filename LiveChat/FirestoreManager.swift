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
    
    func searchRoom(uuid: String) {
        let docRef = db.collection("messages").document(uuid).collection("messages")
            docRef.getDocuments { snapshot, error in
            snapshot?.documents.forEach({ queryDocumentSnapshot in
                do {
                    let foo = try queryDocumentSnapshot.data(as: MessageItem.self)
                    print("foo messageContent: \(foo.messageContent)")
                } catch {
                    print("foo error searchRoom: \(error)")
                }
            })
        }

//        docRef.getDocument(as: String.self) { result in
//
//            switch result {
//            case .success(let response):
//                print("foo response: \(response)")
//            case .failure(let error):
//                docRef.setData(["message":"slm"])
//            }
//       }
    }
    
    func sendMessage(uuid: String, messageItem: MessageItem) {
        let docRef = db.collection("messages").document(uuid).collection("messages")
        do {
            try docRef.document(Date().ISO8601Format()).setData(from: messageItem)
        } catch {
            print("foo errr sendMessage: \(error)")
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

struct MessageItem: Codable {
    let messageContent: String
    let userId: String
    let messageDate: String
}
