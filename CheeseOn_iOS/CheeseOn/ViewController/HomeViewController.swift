//
//  HomeViewController.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 17/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var temp: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
  
        let gesture = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.home))
        temp.addGestureRecognizer(gesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        overrideUserInterfaceStyle = .dark//Singleton.sharedInstance.colorTheme
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        overrideUserInterfaceStyle = .dark//Singleton.sharedInstance.colorTheme
    }
    
    @objc func home() {     // Change page to Home page
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let profileViewController = storyboard.instantiateViewController(withIdentifier:"profileViewController")as! ProfileViewController
        self.navigationController?.pushViewController(profileViewController, animated:true) // Push the Home page
    }
    
    

}
