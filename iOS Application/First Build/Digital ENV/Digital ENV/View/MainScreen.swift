//
//  MainScreen.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 23/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    
    // MARK: - IB Outlets
    @IBOutlet weak var expireBuildButtonView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func expireBuildButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
