//
//  ProfileScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 28/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class ProfileScreen: UIViewController {
    
    
    let userDefaults: UserDefaults = UserDefaults.standard
    
    
    var nameString: String = ""
    var surnameString: String = ""
    var loginString: String = ""
    var passwordString: String = ""
    var regionString: String = ""
    
    
    // MARK: - Раздел описания Outlet'ов
    @IBOutlet var bottomBarButtons: [UIButton]!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var achievementView: UIView!
    @IBOutlet weak var articleView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var achievementsImageView: [UIImageView]!
    @IBOutlet var articlesImageView: [UIImageView]!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var profileNameSurnameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка кнопок
        for i in 0 ... (bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].setBackgroundImage(UIImage(named: "normal\(i).png"), for: .normal)
        }
        
        
        // Настройка профиля
        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.width / 6
        
        self.profileView.layer.cornerRadius = 10
        self.achievementView.layer.cornerRadius = 10
        self.articleView.layer.cornerRadius = 10
        
        for i in 0 ... (self.achievementsImageView.count - 1) {
            self.achievementsImageView[i].layer.cornerRadius = self.achievementsImageView[i].bounds.width / 2
        }
        for i in 0 ... (self.articlesImageView.count - 1) {
            self.articlesImageView[i].layer.cornerRadius = 10
        }
        
        
        self.profileNameSurnameLabel.text = "\(self.nameString) \(self.surnameString)"
        self.regionLabel.text = "\(self.regionString)"
        
    }
    
    
    
    
    // MARK: - Раздел описания и реализации Action'ов
    
    // Открытие главного экрана
    @IBAction func mainScreenTouchUp(_ sender: Any) {
        for i in 0 ... (self.bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].backgroundImage(for: .normal)
        }
        self.bottomBarButtons[0].backgroundImage(for: .selected)
    }
    
    // Открытие экрана мероприятий
    @IBAction func eventCategoriesScreenTouchUp(_ sender: Any) {
        for i in 0 ... (self.bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].backgroundImage(for: .normal)
        }
        self.bottomBarButtons[1].backgroundImage(for: .selected)
    }
    
    // Открытие экрана с новостной лентой
    @IBAction func newsFeedScreenTouchUp(_ sender: Any) {
        for i in 0 ... (self.bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].backgroundImage(for: .normal)
        }
        self.bottomBarButtons[2].backgroundImage(for: .selected)
    }
    
    // Открытие экрана с профилем
    @IBAction func profileScreenTouchUp(_ sender: Any) {
        for _ in 0 ... 6 {
            self.bottomBarButtons[3].backgroundImage(for: .normal)
            sleep(UInt32(0.1))
            self.bottomBarButtons[3].backgroundImage(for: .selected)
            sleep(UInt32(0.1))
        }
    }
    
    // Открытие экрана с настройками
    @IBAction func settingsScreenTouchUp(_ sender: Any) {
        for i in 0 ... (self.bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].backgroundImage(for: .normal)
        }
        self.bottomBarButtons[4].backgroundImage(for: .selected)
    }
    
    
    // Изменение данных передача по сигвею
    @IBAction func editProfileTouchUp(_ sender: Any) {
        performSegue(withIdentifier: "EditProfileData", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if  segue.identifier = ("EditProfileData") {
            guard let destinationController = segue.destination as? EditProfileScreen else { return }
            destinationController.nameString = self.nameString
            destinationController.surnameString = self.surnameString
            destinationController.loginString = self.loginString
            destinationController.passwordString = self.passwordString
//        }
    }
    
    
}
