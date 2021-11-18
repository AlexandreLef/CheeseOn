//
//  Classes.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 18/11/2021.
//

import UIKit


// User class
class User {
    var username: String!
    var keepConnected: Bool!
        
    init(userName: String, keepConneced: Bool) {
        self.username = userName
        self.keepConnected = keepConneced
    }
    
    func reinit() {     // Reinitialisation of the User
        username = nil
        keepConnected = false
    }
    
    func registerUser(){    // Save the User in defaults
        UserDefaults.standard.set(self, forKey: "User")  // Saving user
    }
    
}

// Style
class Style {
    
    let yellow: UIColor! = UIColor(red: 230, green: 195, blue: 89, alpha: 1)
    let purple: UIColor! = UIColor(red: 155, green: 110, blue: 195, alpha: 1)
    let white: UIColor! = UIColor.white
    let black: UIColor! = UIColor.black
    
    let corp: UIFont! = UIFont(name: "Helvetica Neue", size: 12)
    
    init() {
        
    }
}
