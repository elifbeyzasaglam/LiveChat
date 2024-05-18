//
//  CustomTabBarController.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 25.04.2024.
//

import UIKit
import FirebaseDatabase
class CustomTabBarController: UITabBarController {

    let messageVC = MessageListVC()
    let homeVC = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 
        messageVC.title = "Mesajlar"
        messageVC.tabBarItem.image = UIImage(systemName: "message")
        messageVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        
        homeVC.title = "Ana Sayfa"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        setViewControllers([homeVC,messageVC], animated: true)
        
        

        
    }
}
