//
//  SignupViewController.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 4/20/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation
import UIKit

// SignupViewController is to sign up a new user
class SignupViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var password: UITextField!

    var userTextDidChange: Bool = false
    var passwordTextDidChange: Bool = false
    var firstNameTextDidChange: Bool = false
    var lastNameDidChange: Bool = false
    var emailTextDidChange: Bool = false
    
    override func viewDidLoad() {
        firstname.addTarget(self, action: #selector(firstTextDidChange(_:)), for: .editingDidBegin)
        lastname.addTarget(self, action: #selector(lastTextDidChange(_:)), for: .editingDidBegin)
        email.addTarget(self, action: #selector(emailDidChange(_:)), for: .editingDidBegin)
        username.addTarget(self, action: #selector(userTextDidChange(_:)), for: .editingDidBegin)
        password.addTarget(self, action: #selector(passwordTextDidChange(_:)), for: .editingDidBegin)
        
        firstname.addTarget(self, action: #selector(firstTextDidEndEdit(_:)), for: .editingDidEnd)
        lastname.addTarget(self, action: #selector(lastTextDidEndEdit(_:)), for: .editingDidEnd)
        email.addTarget(self, action: #selector(emailDidEndEdit(_:)), for: .editingDidEnd)
        username.addTarget(self, action: #selector(userTextDidEndEdit(_:)), for: .editingDidEnd)
        password.addTarget(self, action: #selector(passwordTextDidEndEdit(_:)), for: .editingDidEnd)
    }

    //when the text changes intially, it clears the text, so the user can easily type
    @objc func userTextDidChange(_ textField: UITextField) {
        if !userTextDidChange {
            username.text = ""
        }
        userTextDidChange = true
    }
    
    @objc func firstTextDidChange(_ textField: UITextField) {
        if !firstNameTextDidChange {
            firstname.text = ""
        }
        firstNameTextDidChange = true
    }
    
    @objc func lastTextDidChange(_ textField: UITextField) {
        if !lastNameDidChange {
            lastname.text = ""
        }
        lastNameDidChange = true
    }
    
    @objc func emailDidChange(_ textField: UITextField) {
        if !emailTextDidChange {
            email.text = ""
        }
        emailTextDidChange = true
    }

    @objc func passwordTextDidChange(_ textField: UITextField) {
        if !passwordTextDidChange {
            password.text = ""
        }
        passwordTextDidChange = true
    }
    
    @objc func userTextDidEndEdit(_ textField: UITextField) {
        username.text = username.text
    }
    
    @objc func firstTextDidEndEdit(_ textField: UITextField) {
        firstname.text = firstname.text
    }
    
    @objc func lastTextDidEndEdit(_ textField: UITextField) {
        lastname.text = lastname.text
    }
    
    @objc func emailDidEndEdit(_ textField: UITextField) {
        email.text = email.text
    }
    
    @objc func passwordTextDidEndEdit(_ textField: UITextField) {
        password.text = password.text
    }

    // This function checks if user name or password is empty
    // and finishes signing up the user
    @IBAction func signupAction(_ sender: Any) {
        guard let username = username.text else {
            return
        }
        if username.lowercased() == "username" || username.isEmpty {
            let alertController = UIAlertController(title: "Helping Hand", message:
                "Username cannot be empty!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        guard let password = password.text else {
            return
        }
        if password.lowercased() == "password" || password.isEmpty {
            let alertController = UIAlertController(title: "Helping Hand", message:
                "Password cannot be empty!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        
        let user = Defaults.getNameAndPassword(username)
        if username == user.name {
        } else {
            Defaults.saveNameAndPassword(username, password)
        }

        // Set user is logged in
        let defaults = UserDefaults.standard
        defaults.set(username, forKey: "user")

        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: MainViewController.self) {
                self.navigationController!.popToViewController(controller, animated: false)
                break
            }
        }
    }
}
