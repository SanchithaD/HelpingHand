//
//  LoginViewController.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 4/19/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation
import UIKit

// Allows the user to login to an already signed up account
class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!

    var userTextDidChange: Bool = false
    var passwordTextDidChange: Bool = false
    
    override func viewDidLoad() {
        userName.addTarget(self, action: #selector(userTextDidChange(_:)), for: .editingDidBegin)
        password.addTarget(self, action: #selector(passwordTextDidChange(_:)), for: .editingDidBegin)
        userName.addTarget(self, action: #selector(userTextDidEndEdit(_:)), for: .editingDidEnd)
        password.addTarget(self, action: #selector(passwordTextDidEndEdit(_:)), for: .editingDidEnd)
    }

    //when the text changes intially, it clears the text, so the user can easily type
    @objc func userTextDidChange(_ textField: UITextField) {
        if !userTextDidChange {
            userName.text = ""
        }
        userTextDidChange = true
    }

    @objc func passwordTextDidChange(_ textField: UITextField) {
        if !passwordTextDidChange {
            password.text = ""
        }
        passwordTextDidChange = true
    }

    @objc func userTextDidEndEdit(_ textField: UITextField) {
        userName.text = userName.text
    }

    @objc func passwordTextDidEndEdit(_ textField: UITextField) {
        password.text = password.text
    }
    //gets username and password from the text fields and compares with the stored user defaults username and password
    //and logs the user in
    @IBAction func loginUser(_ sender: Any) {
        
        guard let username = userName.text else {
            return
        }
        guard let password = password.text else {
            return
        }
        
        let user = Defaults.getNameAndPassword(username)
        
        if username == user.name && password == user.password {
            // set user is logged in
            let defaults = UserDefaults.standard
            defaults.set(username, forKey: "user")

            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: MainViewController.self) {
                    self.navigationController!.popToViewController(controller, animated: false)
                    break
                }
            }
        } else {
            let alertController = UIAlertController(title: "Helping Hand", message:
                "Incorrect Login, please signup!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }

    }
}
