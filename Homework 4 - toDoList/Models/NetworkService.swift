//
//  NetworkService.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 26.07.2022.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    
    func signIn(login: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if login.lowercased() == "olvr" && password == "123" {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}
