//
//  Message.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 28.03.2024.
//

import UIKit

class MessageVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthManager.shared.logout {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.dismiss(animated: true)
            }
        }
    }
}

