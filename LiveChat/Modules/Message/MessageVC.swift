//
//  Message.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 28.03.2024.
//

import UIKit

final class MessageVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var messageTextField: UITextField!
    
    var uuid: String = ""
    var selectedUserId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        getMessages()
    }
    
    private func registerCells() {
        let senderCellName = String(describing: SenderCell.self)
        let senderCellNib = UINib(nibName: senderCellName, bundle: .main)
        tableView.register(senderCellNib, forCellReuseIdentifier: senderCellName)
        
        let receiverCellName = String(describing: RecevierCell.self)
        let receiverCellNib = UINib(nibName: receiverCellName, bundle: .main)
        tableView.register(receiverCellNib, forCellReuseIdentifier: receiverCellName)
    }
    
    private func getMessages() {
        FirestoreManager.shared.searchRoom(uuid: uuid)
    }
    
    @IBAction func sendMessageButtonTapped(_ sender: Any) {
        RealtimeDatabaseManager.shared.addNewRoomIdToUser(uuid: AuthManager.shared.userId, selectedUserId: selectedUserId)
        FirestoreManager.shared.sendMessage(uuid: uuid, messageItem: MessageItem(messageContent: messageTextField.text ?? "", userId: AuthManager.shared.userId, messageDate: Date().formatted(date: .complete, time: .complete)))
    }
}

