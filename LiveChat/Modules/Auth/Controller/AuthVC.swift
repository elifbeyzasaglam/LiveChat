//
//  AuthVC.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 17.03.2024.
//

import UIKit
import FirebaseAuth

class AuthVC: UIViewController {
    
    enum AuthVCStatus {
        case signIn
        case signUp
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBOutlet private weak var titleLabel: UILabel!
    private var authVCStatus: AuthVCStatus = .signIn
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        if authVCStatus == .signIn {
            titleLabel.text = "Sign up to your account"
            authVCStatus = .signUp
            passwordConfirmTextField.isHidden = false
        } else {
            if let mail = emailTextField.text,
               let password = passwordTextField.text {
                AuthManager.shared.signUp(mail: mail, password: password) { [weak self] result in
                    switch result {
                    case .success(let user):
                        print(user.uid)
                        self?.navigateToMainVC()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        if authVCStatus == .signUp {
            titleLabel.text = "Sign in to your account"
            authVCStatus = .signIn
            passwordConfirmTextField.isHidden = true
        } else {
            if let mail = emailTextField.text,
               let password = passwordTextField.text {
                AuthManager.shared.signIn(mail: mail, password: password) { [weak self] result in
                    switch result {
                    case .success(let user):
                        print(user.uid)
                        self?.navigateToMainVC()
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    
    private func navigateToMainVC() {
        let mainVC = MainVC()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

    @IBAction func forwardPasswordButton(_ sender: Any) {
    }
    
}
