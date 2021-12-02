//
//  LogInViewController.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 18/11/2021.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var keepConnect: UILabel!
    @IBOutlet weak var connexion: UIButton!
    @IBOutlet weak var radio: UIImageView!

    var keepConnectStatus: Bool = false
    var style = Style()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.home)) // Save the tap on button
        connexion.addGestureRecognizer(gesture) // Cast the gesture
        let gest = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.changeColor)) // Save the tap on button
        radio.addGestureRecognizer(gest) // Cast the gesture
        
        username.delegate = self
        
        connexion.layer.borderWidth = 4
        connexion.layer.borderColor = style.purple.cgColor
        connexion.layer.cornerRadius = connexion.frame.size.height / 2
        connexion.titleLabel!.font = style.login
        
        keepConnect.font = style.login
        
        username.font = style.login
        
        radio.layer.cornerRadius = radio.frame.size.height / 2
        radio.backgroundColor = style.transparent

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated) // Remove the navigation bar on the view
    }
        
    @objc func home() {     // Change page to Home page
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier:"homeViewController")as! HomeViewController
        self.navigationController?.pushViewController(homeViewController, animated:true) // Push the Home page
    }
    
    @IBAction func connect() {
        let user = User(userName: username.text!, keepConneced: keepConnectStatus)
        user.registerUser()
    }
    
    @objc func changeColor() {
        if radio.backgroundColor == style.transparent {
            radio.backgroundColor = style.yellow
            keepConnectStatus = true
        } else {
            radio.backgroundColor = style.transparent
            keepConnectStatus = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        username.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count ?? 0) > 7 {
            
            if string == "" {
                return true
            }
            
            return false
        }
        
        return true
    }
}
