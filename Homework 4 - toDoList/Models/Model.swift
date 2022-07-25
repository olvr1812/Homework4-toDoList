//
//  model.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 24.07.2022.
//

import Foundation

var dictionary: [String: String] = [:]

class User {
    var login: String
    var password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
