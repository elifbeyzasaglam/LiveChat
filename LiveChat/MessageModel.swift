//
//  MessageModel.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 24.05.2024.
//

import Foundation
import MessageKit
struct MessageModel: Codable, SenderType {
    var id = UUID().uuidString
    var displayName: String
    var senderId: String
    var content: String
}
