//
//  CustomTabBarController.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 25.04.2024.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let messageVC = MessageVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageVC.title = "Mesajlar"
        messageVC.tabBarItem.image = UIImage(systemName: "message")
        messageVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        setViewControllers([messageVC], animated: true)
    }
}
