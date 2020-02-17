//
//  EditProfileScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 28/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class EditProfileScreen: UIViewController, UITextFieldDelegate {
    
    let userDefaults: UserDefaults = UserDefaults.standard
    
    var nameString: String = ""
    var surnameString: String = ""
    var loginString: String = ""
    var passwordString: String = ""
    var regionString: String = ""
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var regionTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.surnameTextField.delegate = self
        self.regionTextField.delegate = self
        
        self.nameTextField.text = nameString
        self.surnameTextField.text = surnameString
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(SplashAndSignScreen.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SplashAndSignScreen.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.width / 6
        
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 90
            }

        }

        @objc func keyboardWillHide(notification: Notification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += 90
            }
        }
        
        
        
        // нажатие на return  скрывает клаву
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case self.nameTextField:
                self.nameTextField.resignFirstResponder()
            case self.surnameTextField:
                self.surnameTextField.resignFirstResponder()
            case regionTextField:
                self.regionTextField.resignFirstResponder()
            default:
                break
            }
            return true
        }
    

    // отмена именения профиля
    @IBAction func closeProfileEditingScreenTouchUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //  сохранение данных профиля
    @IBAction func saveProfileSettingsTouchUp(_ sender: Any) {
        self.userDefaults.setValue(self.nameTextField.text!, forKey: "Name")
        self.userDefaults.setValue(self.surnameTextField.text!, forKey: "Surname")
        self.userDefaults.setValue(self.loginString, forKey: "Login")
        self.userDefaults.setValue(self.passwordString, forKey: "Password")
        self.userDefaults.setValue(self.regionTextField.text!, forKey: "Region")
        performSegue(withIdentifier: "ProfileData", sender: nil)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? ProfileScreen else { return }
        destinationController.nameString = self.nameString
        destinationController.surnameString = self.surnameString
        destinationController.loginString = self.loginString
        destinationController.passwordString = self.passwordString
        destinationController.regionString = self.regionString
    }
    
    
}
