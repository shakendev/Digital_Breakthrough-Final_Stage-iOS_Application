//
//  SplashAndSignScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 27/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//


// MARK: - Импортирование фреймворков

// Импортирование фреймворка UIKit для работы с UI элементами
import UIKit




// MARK: - Класс SplashAndSignScreen
final class SplashAndSignScreen: UIViewController, UITextFieldDelegate {
    
    // MARK: - Раздел объявления констант
    
    
    
    // MARK: - Раздел объявления переменных
    var loginString: String = ""
    var passwordString: String = ""
    
    let userDefaults: UserDefaults = UserDefaults.standard
    
    
    // MARK: - Раздел объявления Outlet'ов
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoLabelView: UIView!
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIView!
    @IBOutlet weak var signUpButton: UIView!
    
    
    // MARK: - Раздел описания и реализации методов
    
    // Метод, который срабатывает после команды отрытия текущего UIViewController
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Определение и инициализация свойств класса происходит до метода veiwDidLoad()
    
    // Метод, который срабатывает после загрузки UIViewController в память устройства
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Скрытие элементов
        self.logoLabelView.alpha = CGFloat(0.0)
        self.registrationView.alpha = CGFloat(0.0)
        self.registrationView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        
        // Работа с клавой
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(SplashAndSignScreen.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SplashAndSignScreen.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        self.signInButton.layer.cornerRadius = 20
        
        
        
    }

    @objc func keyboardWillShow(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= 200
//            }
//        }
        
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 200
        }

    }

    @objc func keyboardWillHide(notification: Notification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0 {
//                self.view.frame.origin.y += 200
//            }
//        }
        
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y += 200
        }
    }
    
    
    
    // нажатие на return  скрывает клаву
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            self.loginTextField.resignFirstResponder()
        case passwordTextField:
            self.passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
    
    
    // Метод, который срабатывает перед отображением UIViewController на экране устройства
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.logoImageView.frame = CGRect(x: 90, y: 214, width: 140, height: 140)
        self.logoLabelView.frame = CGRect(x: 58, y: 284, width: 204, height: 36)
        
        sleep(1)
        
    }
    
    // Метод, который срабатывает перед изменением размера UIViewController на экране устройства
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // Метод, который срабатывает после изменения размера UIViewController на экране устройства
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // Метод, который срабатывает после отображения UIViewController на экране устройства
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0) {
            self.logoImageView.frame = CGRect(x: 96, y: 78, width: 128, height: 128)
            self.logoImageView.layer.cornerRadius = self.logoImageView.bounds.width
             / 2
        }
        
        UIView.animate(withDuration: 1.0) {
            self.logoLabelView.alpha = CGFloat(1.0)
            self.logoLabelView.frame = CGRect(x: 58, y: 214, width: 204, height: 36)
            self.registrationView.alpha = CGFloat(1.0)
            self.registrationView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        }
        
    }
    
    // Метод, который срабатывает при повороте устройства
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    // Метод, который срабатывает перед закрытием UIViewController
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // Метод, который срабатывает после закрытия UIViewController
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // Метод, который срабатывает при нехватке памяти в устройстве
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Метод, который срабатывает при выгрузке объекта из памяти
    deinit {
        
    }
    
    
    // Вход с аккаунтом
    @IBAction func signInWithLoginAndPasswordTouchUp(_ sender: Any) {
        self.loginString = self.loginTextField.text!
        self.passwordString = self.passwordTextField.text!
//        var temporaryLoginString: String = ""
//        var temporaryPasswordString: String = ""
//        if let login = userDefaults.object(forKey: "Login") {
//            temporaryLoginString = (login as? String)!
//        }
//        if let password = userDefaults.object(forKey: "Password") {
//            temporaryPasswordString = (password as? String)!
//        }
//        if (loginString != temporaryLoginString) || (passwordString != temporaryPasswordString) {
//            let alertController = UIAlertController(title: "Неверные данные", message: "Вы ввели неверный логин или пароль", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
//                return
//            }
//            alertController.addAction(action)
//            self.present(alertController, animated: true, completion: nil)
//        } else {
        
        self.performSegue(withIdentifier: "MainScreenSegue", sender: nil)
        
        
//
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyBoard.instantiateViewController(withIdentifier: "MainScreenID")
//        viewController.modalPresentationStyle = .fullScreen
//        viewController.modalTransitionStyle = .coverVertical
//        self.present(viewController, animated: true, completion: nil)
//        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // POST запрос
        guard let url = URL(string: "http://84.201.138.44:8080/v2/login") else { return }
        let parameters = ["login": self.loginString, "password": self.passwordString]
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
                let dich = try JSONDecoder().decode(Dich.self, from: data)
                guard let destinationController = segue.destination as? MainScreen else { return }
                destinationController.loginString = dich.login
                print(dich)
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    

}
