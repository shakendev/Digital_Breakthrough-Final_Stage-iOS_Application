//
//  SplashScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 23/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    

}
