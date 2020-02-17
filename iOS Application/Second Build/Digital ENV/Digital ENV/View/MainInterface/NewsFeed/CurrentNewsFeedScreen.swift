//
//  CurrentNewsFeed.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 28/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//

import UIKit

class CurrentNewsFeedScreen: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.textView.layer.cornerRadius = 10
    }
    
    
    @IBAction func cancelAddingNewFeed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewFeed(_ sender: Any) {
        // POST запрос
//        guard let url = URL(string: "http://84.201.138.44:8080/v2/article") else { return }
//        let parameters = ["author": self.]
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
//        request.httpBody = httpBody
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//            
//            guard let data = data else { return }
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//                
//            } catch {
//                print(error)
//            }
//            
//        }.resume()
        
    }
    
}
