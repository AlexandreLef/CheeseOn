//
//  LogInViewController.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 18/11/2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var keepConnect: UIButton!
    @IBOutlet weak var connexion: UIButton!
    @IBOutlet weak var test: UIImageView!

    var keepConnectStatus: Bool = false
    var style = Style()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.home)) // Save the tap on button
        connexion.addGestureRecognizer(gesture) // Cast the gesture
        let gest = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.changeColor)) // Save the tap on button
        test.addGestureRecognizer(gest) // Cast the gesture
        
        connexion.layer.borderWidth = 7
        connexion.layer.borderColor = style.purple.cgColor
        connexion.layer.cornerRadius = connexion.frame.size.height / 2
        
        test.layer.cornerRadius = test.frame.size.height / 2
        
        keepConnect.tintColor = style.purple
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

    @IBAction func checkKeepConnect() {
        keepConnectStatus = !keepConnectStatus
        if keepConnectStatus {
            keepConnect.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            keepConnect.tintColor = style.yellow
        } else {
            keepConnect.setImage(UIImage(systemName: "circle"), for: .normal)
            keepConnect.tintColor = style.purple
        }
    }
    
    @objc func changeColor() {
        test.backgroundColor = style.yellow
    }
    
}
