//
//  CompleteProfileVC.swift
//  LiveChat
//
//  Created by ELİF BEYZA SAĞLAM on 1.05.2024.
//

import UIKit
import FirebaseDatabase
final class CompleteProfileVC: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    private var user = UserModel(id: "", name: "", lastName: "", mail: "", userName: "")
    private let currentUser = Database.database().reference().child("users").child(AuthManager.shared.userId)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getUser()
        
       
    }
    
    @IBAction func didTappedSaveButton(_ sender: Any) {
        fillUserInfo()
    }
    private func getUser() {
        currentUser.observe(.value) { snapshot in
            do {
                let user = try snapshot.data(as: UserModel.self)
                print("foo user: \(user)")
                self.user = user
            } catch {
                print("foo: \(error)")
            }
        }
    }
    
    private func fillUserInfo() {
        self.user.name = nameTextField.text ?? ""
        self.user.lastName = lastNameTextField.text ?? ""
        self.user.userName = userNameTextField.text ?? ""
        
        do {
            try currentUser.setValue(from: self.user)
            self.navigateToMainVC()
        } catch {
            print("foo err: \(error)")
        }
    }
    
    private func navigateToMainVC() {
        let mainVC = CustomTabBarController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
