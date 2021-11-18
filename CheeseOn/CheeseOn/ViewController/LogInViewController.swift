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

    var keepConnectStatus: Bool = false
    var style = Style()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.home)) // Save the tap on button
        connexion.addGestureRecognizer(gesture) // Cast the gesture
        
        
        connexion.layer.borderWidth = 7
        connexion.layer.borderColor = style.purple.cgColor
        connexion.layer.cornerRadius = connexion.frame.size.height / 2 
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
            keepConnect.setImage(UIImage(systemName: "record.circle.fill"), for: .normal)
        } else {
            keepConnect.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        }
    }
    
}
