//
//  ChatVC.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 24.05.2024.
//

import UIKit
import MessageKit

class ChatVC: MessagesViewController {
    let messages: [MessageType] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }

}

extension ChatVC: MessagesDataSource {
    var currentSender: any MessageKit.SenderType {
        return MessageModel(displayName: "Ufuk", senderId: AuthManager.shared.userId, content: "selam")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}

extension ChatVC: MessagesLayoutDelegate {
    
}

extension ChatVC: MessagesDisplayDelegate {
    
}
