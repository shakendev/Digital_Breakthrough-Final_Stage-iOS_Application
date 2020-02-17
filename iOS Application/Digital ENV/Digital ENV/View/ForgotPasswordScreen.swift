//
//  ForgotPasswordScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 28/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class ForgotPasswordScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // Отмена восстановления пароля
    @IBAction func cancelPasswordRestoreTouchUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
