//
//  UserModel.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 14.04.2024.
//

import Foundation

struct UserModel: Codable {
    let id: String
    var name: String
    var lastName: String
    let mail: String
    var userName: String
    var chatRoomIds: [String]?
}
