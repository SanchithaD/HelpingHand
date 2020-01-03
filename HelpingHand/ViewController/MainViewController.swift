//
//  MainViewController.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 4/20/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation
import UIKit

// The MainViewController is the Main menu consisting of the main sections
// to navigate to parts of the app
class MainViewController: UIViewController {
    
    @IBOutlet weak var loginTitle: UIButton!
    @IBOutlet weak var loginBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        // Sets custom font in navigation bar and bar button item
        let loginAttrs = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 20)!
        ]
        
        loginBarButton.setTitleTextAttributes(loginAttrs, for: .normal)
        loginBarButton.setTitleTextAttributes(loginAttrs, for: .selected)
        
        let navigationColor = UIColor(red: 106/255, green: 23/255, blue: 64/255, alpha: 1.0)
        let navigationAttrs = [
            NSAttributedString.Key.foregroundColor: navigationColor,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 30)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = navigationAttrs
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Checks if user is logged in and sets title
        let defaults = UserDefaults.standard
        if let userName = defaults.string(forKey: "user") {
            let userString = "Welcome " + userName + "!"
            loginTitle.setTitle(userString, for: .normal)
            loginBarButton.title = "Logout"
        }
        self.title = "Helping Hand"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let defaults = UserDefaults.standard
        // Update "Login" or "Logout" text in bar button based if user is logged in
        if let barButton = sender as? UIBarButtonItem {
            if barButton.title == "Logout" {
                defaults.removeObject(forKey: "user")
                let userString = "Welcome Guest!"
                loginTitle.setTitle(userString, for: .normal)
                barButton.title = "Login"
                return false
            } else if barButton.title == "Login" {
                return true
            }
        }
        return true
    }
}
