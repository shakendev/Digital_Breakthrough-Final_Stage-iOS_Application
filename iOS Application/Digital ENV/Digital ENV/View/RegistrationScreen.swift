//
//  RegistrationScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 27/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//


// MARK: - Импортирование фреймворков

// Импортирование фреймворка UIKit для работы с UI элементами
import UIKit


// MARK: - Класс RegistrationScreen
final class RegistrationScreen: UIViewController, UITextFieldDelegate {
    
    // MARK: - Раздел объявления констант
    let userDefaults: UserDefaults = UserDefaults.standard
    
    
    // MARK: - Раздел объявления переменных
    var nameString: String  = ""
    var surnameString: String = ""
    var loginString: String = ""
    var passwordString: String = ""
    
    
    
    
    // MARK: - Раздел объявления Outlet'ов
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButtonView: UIView!
    
    
    
    // MARK: - Раздел описания и реализации методов
    
    
    
    // дописать жизненный цикл View Controller
    
    // Функция, вызывающаяся перед тем как будет отрисован UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Работа с клавой
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationScreen.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegistrationScreen.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.createAccountButtonView.layer.cornerRadius = 20
        
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
    //        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    //            if self.view.frame.origin.y == 0 {
    //                self.view.frame.origin.y -= 200
    //            }
    //        }
            
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 76
            }

        }

        @objc func keyboardWillHide(notification: Notification) {
    //        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    //            if self.view.frame.origin.y != 0 {
    //                self.view.frame.origin.y += 200
    //            }
    //        }
            
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += 76
            }
        }
        
        
        
        // нажатие на return  скрывает клаву
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case self.nameTextField:
                self.nameTextField.resignFirstResponder()
            case self.surnameTextField:
                self.surnameTextField.resignFirstResponder()
            case self.loginTextField:
                self.loginTextField.resignFirstResponder()
            case self.passwordTextField:
                self.passwordTextField.resignFirstResponder()
            default:
                break
            }
            return true
        }
    
    
    // Функция, вызывающаяся при нехватке RAM
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // Отмена регистрации
    @IBAction func cancelRegistrationTouchUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Создать аккаунт
    @IBAction func createAccountTouchUp(_ sender: Any) {
        let alertController: UIAlertController = UIAlertController(title: "Профиль", message: "Рекомендуем заполнить оставшиеся поля в настройках профиля", preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            self.performSegue(withIdentifier: "RegistrationData", sender: nil)
        }
        alertController.addAction(action)
        // сохранить данные на патефон
        self.userDefaults.setValue(self.nameTextField.text, forKey: "Name")
        self.userDefaults.setValue(self.surnameTextField.text, forKey: "Surname")
        self.userDefaults.setValue(self.loginTextField.text, forKey: "Login")
        self.userDefaults.setValue(self.passwordTextField.text, forKey: "Password")
        self.userDefaults.setValue("Нет данных", forKey: "Region")
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? ProfileScreen else { return }
        
        self.nameString = (self.nameTextField.text)!
        self.surnameString = (self.surnameTextField.text)!
        self.loginString = (self.loginTextField.text)!
        self.passwordString = (self.passwordTextField.text)!
        
        destinationController.nameString = self.nameString
        destinationController.surnameString = self.surnameString
        destinationController.loginString = self.loginString
        destinationController.passwordString = self.passwordString
        destinationController.regionString = "Нет данных"
        
        
        // POST запрос
        guard let url = URL(string: "http://84.201.138.44:8080/v2/user") else { return }
        let parameters = ["firstName": self.nameString, "login": self.loginString, "password": self.passwordString, "region": "Нет данных", "secondName": self.surnameString]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
            } catch {
                print(error)
            }
            
        }.resume()
        
        
        // GET запрос
//        guard let url = URL(string: "http://localhost/v2/user") else {
//            return
//        }
//
//        let session = URLSession.shared
//        session.dataTask(with: url) { (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//
//            guard let data = data else {
//                return
//            }
//            print(data)
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//            } catch {
//                print(error)
//            }
//
//        }.resume()
        
    }
    
    
}
