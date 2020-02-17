//
//  ExtendedSettingsScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 28/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class ExtendedSettingsScreen: UIViewController {
    
    @IBOutlet weak var teamLogoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teamLogoImageView.layer.cornerRadius = 30
    }
    

    
    @IBAction func closeTouchUp(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
