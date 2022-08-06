//
//  model.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 24.07.2022.
//

import Foundation
import UIKit
import CoreData

struct User {
    var login: String
    var password: String
}

class Users {
    
    var users = [UsersCoreData]()
    
    func setContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func newUser(login: String, password: String) {
        let context = setContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "UsersCoreData", in: setContext()) else { return }
        
        let user = UsersCoreData(entity: entity, insertInto: context)
        user.login = login
        user.password = password
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func fetchUsers() {
        let context = setContext()
        let fetchRequest: NSFetchRequest<UsersCoreData> = UsersCoreData.fetchRequest()
        
        do {
            users = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        print(users.count)
        users.map { print("login: \($0.login), password: \(String(describing: $0.password))") }
    }
    
    func checkNewUser(newLogin: String) -> Bool {
        return users.contains(where: { $0.login?.lowercased() == newLogin.lowercased() })
    }
    
    func checkUser(login: String, password: String) -> Bool {
        return users.contains(where: { $0.login?.lowercased() == login.lowercased() && $0.password == password
        })
    }
    
    func forgetPassword(login: String) -> String {
        guard let index = users.firstIndex(where: { $0.login!.lowercased() == login.lowercased() }) else { return "Пользователь с таким именем не существует"}
        return "Пароль пользователя \(login): \(users[index].password!)"
    }
}

//class NetworkService {
//    static let shared = NetworkService()
//    private init() { }
//
//    func signInTest(checkUser: UsersCoreData, completion: @escaping(Bool) -> Void) {
//        guard users.users.count != 0 else {
//            completion(false)
//            return
//        }
//
//        DispatchQueue.global().async {
//            DispatchQueue.main.async {
//                for i in users.users {
//                    if i.login!.lowercased() == checkUser.login!.lowercased() && i.password == checkUser.password {
//                        completion(true)
//                    } else {
//                        completion(false)
//                    }
//                }
//            }
//        }
//    }
//}
