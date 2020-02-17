//
//  EventsScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 27/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class EventCategoriesScreen: UIViewController {
    
    @IBOutlet var bottomBarButtons: [UIButton]!
    
    @IBOutlet var firstEventImage: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка кнопок
        for i in 0 ... (bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].setBackgroundImage(UIImage(named: "normal\(i).png"), for: .normal)
        }
        
        for i in 0 ... (self.firstEventImage.count - 1) {
            self.firstEventImage[i].layer.cornerRadius = 17
        }
        
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
        for _ in 0 ... 6 {
            self.bottomBarButtons[1].backgroundImage(for: .normal)
            sleep(UInt32(0.1))
            self.bottomBarButtons[1].backgroundImage(for: .selected)
            sleep(UInt32(0.1))
        }
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

}
