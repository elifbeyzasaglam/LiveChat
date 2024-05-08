//
//  MessageListVC.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 8.05.2024.
//

import UIKit

class MessageListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var messageListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageListTable.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        messageListTable.delegate = self
        messageListTable.dataSource = self

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Beyza"
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // sohbeti burda göster!!
    }
 

}
