//
//  MainScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 28/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    @IBOutlet var bottomBarButtons: [UIButton]!
    
    @IBOutlet weak var cardBackgroundView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var achievementInfoButton: UIButton!
    
    @IBOutlet weak var mainProgressView: UIView!
    @IBOutlet weak var currentProgressView: UIView!
    
    
    @IBOutlet var volonteerViews: [UIView]!
    
    
    
    @IBOutlet weak var bonusesLabel: UILabel!
    
    var loginString: String = ""
    
    var bonuses: Int = 0
    
    struct Frame {
        var center: CGPoint
        var width: CGFloat
        var height: CGFloat
    }
    
    var globalMainCardViewFrame: Frame = Frame(center: CGPoint(x: 0, y: 0), width: 0, height: 0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка кнопок
        for i in 0 ... (bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].setBackgroundImage(UIImage(named: "normal\(i).png"), for: .normal)
        }
        
        
        
        for i in 0 ... (self.volonteerViews.count - 1) {
            self.volonteerViews[i].layer.cornerRadius = 10
        }
        
        
        var color: UIColor = .systemBlue
        var balance: Int = 0
        var level: String = ""
        var step: Int = 1
        
        
        // Запросить данные об аккаунте и количестве добробонусы
        // POST запрос
        guard let url = URL(string: "http://84.201.138.44:8080/v2/user/\(self.loginString)") else { return }
        let parameters = ["login": self.loginString]
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
                self.bonuses = dich.bonuses
                
            } catch {
                print(error)
            }
            
        }.resume()
        
        
        
        switch self.bonuses {
        case 1 ... 50:
            color = .systemBlue
            balance = 50 - bonuses
            level = "Синий уровень"
            step = 1
        case 51 ... 100:
            color = .systemRed
            balance = 100 - bonuses
            level = "Красный уровень"
            step = 2
        case 101 ... 150:
            color = .systemGreen
            balance = 150 - bonuses
            level = "Зеленый уровень"
            step = 3
        case 151 ... 200:
            color = .systemGray
            balance = 200 - bonuses
            level = "Серый уровень"
            step = 4
        case 201 ... 250:
            color = .systemYellow
            balance = 250 - bonuses
            level = "Золотой уровень"
            step = 5
        default:
            break
        }
        
        self.cardView.backgroundColor = color
        self.cardView.layer.cornerRadius = 20
        
        self.cardBackgroundView.layer.cornerRadius = 20

        self.achievementInfoButton.setTitle("\(balance) добробонусов до \(level)", for: .normal)
        self.achievementInfoButton.setTitle("\(balance) добробонусов до \(level)", for: .highlighted)
        
        self.mainProgressView.layer.cornerRadius = self.mainProgressView.bounds.height / 2
        self.currentProgressView.layer.cornerRadius = self.currentProgressView.bounds.height / 2
        self.currentProgressView.backgroundColor = .white
        
        let temp = ((CGFloat(step) * 50.0) - 1) / self.mainProgressView.bounds.width
        
        self.currentProgressView.frame = CGRect(x: 2, y: 2, width: temp, height: 16)
        
        self.bonusesLabel.text = String(bonuses)
        
    }
    
    
    
    
    // MARK: - Раздел описания и реализации Action'ов
        
        // Открытие главного экрана
        @IBAction func mainScreenTouchUp(_ sender: Any) {
            for _ in 0 ... 6 {
                self.bottomBarButtons[0].backgroundImage(for: .normal)
                sleep(UInt32(0.1))
                self.bottomBarButtons[0].backgroundImage(for: .selected)
                sleep(UInt32(0.1))
            }
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
            for i in 0 ... (self.bottomBarButtons.count - 1) {
                self.bottomBarButtons[i].backgroundImage(for: .normal)
            }
            self.bottomBarButtons[3].backgroundImage(for: .selected)
        }
        
        // Открытие экрана с настройками
        @IBAction func settingsScreenTouchUp(_ sender: Any) {
            for i in 0 ... (self.bottomBarButtons.count - 1) {
                self.bottomBarButtons[i].backgroundImage(for: .normal)
            }
            self.bottomBarButtons[4].backgroundImage(for: .selected)
        }
    
    
    @IBAction func openCardInfo(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.cardBackgroundView.transform = CGAffineTransform.init(scaleX: 1.03, y: 1.2)
            self.cardView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }
    }
    
    
    @IBAction func closeCardInfo(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.cardBackgroundView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            self.cardView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        }
    }
    

}
