//
//  AuthVC.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 17.03.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, error in
            if let error {
                print(error)
            } else {
                print("user id: \(result?.user.uid ?? "")")
            }
        }
    }
    
    @IBAction func didTappedSignUpButton(_ sender: Any) {
        //        passwordConfirmTextField.isHidden.toggle()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, error in
            if let error {
                print(error)
            } else {
                print("user id: \(result?.user.uid ?? "")")
            }
        }
    }
    
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] user, error in
                   if let error = error {
                       print(error.localizedDescription)
                   } else {
                       print("user id: \(user?.user.uid ?? "")")
                       self?.navigateToMessageVC()
                   }
               }
    }
private func navigateToMessageVC() {
    let messageVC = MessageVC(nibName: "MessageVC", bundle: nil)
       navigationController?.pushViewController(messageVC, animated: true)
        }

    
    @IBAction func forwardPasswordButton(_ sender: Any) {
    }
    
}
