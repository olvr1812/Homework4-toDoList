//
//  model.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 24.07.2022.
//

import Foundation

var users = [User]()

class User {
    var login: String
    var password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}

class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    
    func signIn(checkUser: User, completion: @escaping(Bool) -> Void) {
        guard users.count != 0 else { return }
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                for i in users {
                    if i.login.lowercased() == checkUser.login.lowercased() && i.password == checkUser.password {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        }
    }
}
