//
//  SettingsScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 28/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//


// MARK: - Импортирование фреймворков

// Импортирование фреймворка UIKit для работы с UI элементами
import UIKit



// MARK: - Класс SettingsScreen
final class SettingsScreen: UIViewController {
    
    // MARK: - Раздел объявления констант
    
    
    
    // MARK: - Раздел объявления переменных
    
    
    
    // MARK: - Раздел объявления Outlet'ов
    @IBOutlet weak var appearenceView: UIView!
    @IBOutlet weak var darkModeView: UIView!
    @IBOutlet var bottomBarButtons: [UIButton]!
    
    
    
    // MARK: - Раздел описания и реализации методов
    
    // Метод, который срабатывает после команды отрытия текущего UIViewController
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Определение и инициализация свойств класса происходит до метода veiwDidLoad()
    
    // Метод, который срабатывает после загрузки UIViewController в память устройства
    override func viewDidLoad() {
        super.viewDidLoad()
        // Скругление углов у UIView
        self.appearenceView.layer.cornerRadius = 15
        self.darkModeView.layer.cornerRadius = 15
        // Настройка кнопок
        for i in 0 ... (bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].setBackgroundImage(UIImage(named: "normal\(i).png"), for: .normal)
        }
    }
    
    // Метод, который срабатывает перед отображением UIViewController на экране устройства
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
    
    // MARK: - Раздел описания и реализации Action'ов
    
    // Открытие главного экрана
    @IBAction func mainScreenTouchUp(_ sender: Any) {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyBoard.instantiateViewController(withIdentifier: "MainScreenID")
        for i in 0 ... (self.bottomBarButtons.count - 1) {
            self.bottomBarButtons[i].backgroundImage(for: .normal)
        }
        self.bottomBarButtons[0].backgroundImage(for: .selected)
//        self.present(viewController, animated: false, completion: nil)
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
        for _ in 0 ... 6 {
            self.bottomBarButtons[4].backgroundImage(for: .normal)
            sleep(UInt32(0.1))
            self.bottomBarButtons[4].backgroundImage(for: .selected)
            sleep(UInt32(0.1))
        }
    }
    
}
