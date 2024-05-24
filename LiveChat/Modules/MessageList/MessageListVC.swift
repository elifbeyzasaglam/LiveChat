//
//  MessageListVC.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 8.05.2024.
//

import UIKit
import FirebaseDatabase
class MessageListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var messageListTable: UITableView!
    private let referance = Database.database().reference()
    private var userList: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageListTable.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        messageListTable.delegate = self
        messageListTable.dataSource = self
        fetchUserList()
        
    }
    
    private func fetchUserList() {
        referance.child("users")
            .observe(.value) { snapshot in
                if let valueDictionary = snapshot.value as? [String: Any] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: valueDictionary)
                        let decoder = JSONDecoder()
                        let userDecoded = try decoder.decode([String: UserModel].self, from: jsonData)
                        print(userDecoded)
                        // TODO: GİRİŞ YAPILAN ARRAY İÇİNDEN SİLİNECEK.
                        self.userList = userDecoded.map({ $0.1 }) // firstIndex
                        self.messageListTable.reloadData()
                    } catch {
                        print("foo error: \(error)")
                    }
                }
            }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = userList[indexPath.row].name
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("foo user: \(userList[indexPath.row].id) - \(AuthManager.shared.userId)")
        let uuid = compareUUID(firstId: AuthManager.shared.userId, secondId: userList[indexPath.row].id)
        FirestoreManager.shared.searchRoom(with: AuthManager.shared.userId, secondId: userList[indexPath.row].id)
//        referance.child("users").child(userList[indexPath.row].id).updateChildValues(["chatRoomIds": [uuid]])
//        referance.child("users").child(AuthManager.shared.userId).updateChildValues(["chatRoomIds": [uuid]])
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
