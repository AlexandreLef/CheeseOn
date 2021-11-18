//
//  Classes.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 18/11/2021.
//

import Foundation


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
        UserDefaults.standard.set(self.username, forKey: "UserName")  // Saving username
        UserDefaults.standard.set(self.keepConnected, forKey: "KeepConneced")  // Saving is choice
    }
    
}
