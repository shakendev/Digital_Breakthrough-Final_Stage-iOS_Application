//
//  NewsFeedScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 27/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

final class NewsFeedScreen: UIViewController {
    
    @IBOutlet var bottomBarButtons: [UIButton]!
    
    @IBOutlet var newsFeedViews: [UIView]!
    @IBOutlet var newsFeedImageViews: [UIImageView]!
    
    @IBOutlet weak var addNewNewsButton: UIButton!
    @IBOutlet weak var addNewNewsView: UIView!
    
    
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var outlets: [UILabel]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка кнопок
        for i in 0 ... (bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].setBackgroundImage(UIImage(named: "normal\(i).png"), for: .normal)
        }
        
        for i in 0 ... (self.newsFeedViews.count - 1) {
            self.newsFeedViews[i].layer.cornerRadius = 10
        }
        
        for i in 0 ... (self.newsFeedImageViews.count - 1) {
            self.newsFeedImageViews[i].layer.cornerRadius = self.newsFeedImageViews[i].bounds.width  / 4
        }
        
        self.addNewNewsView.layer.cornerRadius = self.addNewNewsView.bounds.height / 2
        
        
        
        // GET запрос
        guard let url = URL(string: "http://84.201.138.44:8080/v2/articles") else {
            return
        }

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
//            request.httpBody = httpBody
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            guard let data = data else { return }
            print(data)

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                let articles = try JSONDecoder().decode([Articles].self, from: data)
                for i in 0 ... (self.labels.count - 1) {
                    self.labels[i].text = articles[i].header
                }
                for i in 0 ... (self.outlets.count - 1) {
                    self.outlets[i].text = articles[i].text
                }
                
                
            } catch {
                print(error)
            }

        }.resume()
        
        
        
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
        for _ in 0 ... 6 {
            self.bottomBarButtons[2].backgroundImage(for: .normal)
            sleep(UInt32(0.1))
            self.bottomBarButtons[2].backgroundImage(for: .selected)
            sleep(UInt32(0.1))
        }
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
    

}
