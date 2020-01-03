//
//  Defaults.swift
//  HelpingHand
//
//  Created by Sanchitha Dinesh on 4/20/19.
//  Copyright © 2019 Cassava. All rights reserved.
//

import Foundation


public struct Defaults {
    
    static let (nameKey, passwordKey) = ("name", "password")
    //static let userSessionKey = "com.helpinghand.usersession"
    
    struct User {
        var name: String?
        var password: String?
        
        init(_ user: [String: String]) {
            self.name = user[nameKey]
            self.password = user[passwordKey]
        }
    }
    
    static var saveNameAndPassword = { (name: String, password: String) in
        UserDefaults.standard.set([nameKey: name, passwordKey: password], forKey: nameKey)
    }
    
    static var getNameAndPassword = { (key: String) -> User in
        return User((UserDefaults.standard.value(forKey: nameKey) as? [String: String]) ?? [:])
    }
    
}
