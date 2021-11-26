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
    
    let yellow: UIColor! = UIColor(red: 230/255, green: 195/255, blue: 89/255, alpha: 1)
    let yellow_dark: UIColor = UIColor(red: 236/255, green: 173/255, blue: 64/255, alpha: 1)
    let purple: UIColor! = UIColor(red: 155/255, green: 110/255, blue: 195/255, alpha: 1)
    let purple_dark: UIColor = UIColor(red: 135/255, green: 91/255, blue: 178/255, alpha: 1)
    let white: UIColor! = UIColor.white
    let black: UIColor! = UIColor.black
    
    let corp: UIFont! = UIFont(name: "Helvetica Neue", size: 12)
    
    init() {
        
    }
}

// TextField
class TextField: UITextField {
    
    var style = Style()

    let padding = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 7
        self.layer.borderColor = style.purple.cgColor
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
}