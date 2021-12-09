//
//  Singleton.swift
//  CheeseOn
//
//  Created by Quentin Villanova on 01/12/2021.
//

import UIKit

public class Singleton {
    public static let sharedInstance = Singleton()
    public var colorTheme: UIUserInterfaceStyle = .light
    
    private init() {
    }
    
    public func changeTheme(theme: UIUserInterfaceStyle){
        colorTheme = theme
        print(theme)
    }
}
