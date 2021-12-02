//
//  ProfileViewController.swift
//  CheeseOn
//
//  Created by Alexandre Lefebvre on 18/11/2021.
//

import UIKit

class ProfileViewController: UIViewController,
                                UIImagePickerControllerDelegate,
                                UINavigationControllerDelegate,
                                UITextFieldDelegate {
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var buttonProfilePicture: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pen: UIButton!
    @IBOutlet weak var toggle: UISegmentedControl!
    @IBOutlet weak var disconnect: UIButton!
    
    var style = Style()
    var user = UserDefaults.standard.string(forKey: "Username")

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        overrideUserInterfaceStyle = Singleton.sharedInstance.colorTheme
    }
    
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
        
        if (user == nil) {
            username.text = "Anonyme"
        } else {
            username.text = user
        }
        
        username.delegate = self
        username.isUserInteractionEnabled = false
    }
    
    
    // Arrow to go back to the Homepage
    @IBAction func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // Change profile picture when clic on it (open gallery)
    @IBAction func changeProfilPicture() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        DispatchQueue.main.async {
            self.profilePicture.image = image
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    // Segmented control that change color theme
    @IBAction func changeTheme() {
        print(Singleton.sharedInstance.colorTheme.rawValue)
        if toggle.backgroundColor == style.yellow {
            toggle.backgroundColor = style.purple
            
            Singleton.sharedInstance.colorTheme = .dark
            overrideUserInterfaceStyle = Singleton.sharedInstance.colorTheme
            
        } else {
            toggle.backgroundColor = style.yellow
            
            Singleton.sharedInstance.colorTheme = .light
            overrideUserInterfaceStyle = Singleton.sharedInstance.colorTheme
        }
    }
    
    
    // Change the username when clic on the pen (dismiss keyboard after)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UserDefaults.standard.set(username.text!, forKey: "Username")
            self.view.endEditing(true)
            username.resignFirstResponder()
            username.isUserInteractionEnabled = false
            return false
        }

    @IBAction func openUsername() {
        username.isUserInteractionEnabled = true
        username.becomeFirstResponder()
    }
    
    
    // Disconnect the user and go back to Loginpage
    @IBAction func disconnectButton() {
        UserDefaults.standard.set(nil, forKey: "Username")
        UserDefaults.standard.set(false, forKey: "KeepConnected")
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier:"loginViewController")as! LogInViewController
        self.navigationController?.pushViewController(loginViewController, animated:true)
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
