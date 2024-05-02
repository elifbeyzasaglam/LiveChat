//
//  MainVC.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 31.03.2024.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        AuthManager.shared.logout {
//            self.dismiss(animated: true)
//        }
    }
    
    @IBAction func didTappedLogOutButton(_ sender: Any) {
        AuthManager.shared.logout {
            self.dismiss(animated: true)
        }
    }
}
