//
//  ProfileViewController.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 18/11/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var pen: UIButton!
    @IBOutlet weak var toggle: UISegmentedControl!
    @IBOutlet weak var disconnect: UIButton!
    
    var style = Style()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        back.tintColor = style.purple
        profilePicture.layer.borderWidth = 7
        profilePicture.layer.borderColor = style.purple.cgColor
        profilePicture.layer.cornerRadius = profilePicture.frame.size.height / 2
        profilePicture.backgroundColor = style.yellow
        profilePicture.tintColor = style.purple 
        pen.tintColor = style.purple
        toggle.backgroundColor = style.yellow
        disconnect.tintColor = style.purple
    }
    
    @IBAction func changeTheme() {
        if toggle.backgroundColor == style.yellow {
            toggle.backgroundColor = style.purple
        } else {
            toggle.backgroundColor = style.yellow
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
