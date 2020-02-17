//
//  Types.swift
//  Digital ENV
//
//  Created by Dimka Novikov on 27/09/2019.
//  Copyright © 2019 DDEC. All rights reserved.
//


// MARK: - Импорт модулей и фреймворков


// Импортирование API с основными типами
import Foundation


struct Dich: Decodable {
    var bonuses: Int
    var email: String?
    var firstname: String
    var id: Int
    var login: String
    var password: String
    var region: String
    var secondname: String
}



struct Articles: Decodable {
    var author: Int
    var date: String
    var header: String
    var id: Int
    var likes: Int
    var numberViews: Int
    var text: String
}
