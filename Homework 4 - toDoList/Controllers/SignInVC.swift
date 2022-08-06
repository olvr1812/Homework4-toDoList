//
//  SignInView.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 24.07.2022.
//

import Foundation
import UIKit
import CoreData

class SignInVC: UIViewController {
    
    private lazy var login: String = ""
    private lazy var password: String = ""
    
    private var signInView: SignInView {
        return self.view as! SignInView
    }
    
    override func loadView() {
        super.loadView()
        self.view = SignInView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users.fetchUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.evenToSignUp(self, action: #selector(btnSignUpAction))
        signInView.nameEditingChange(self, action: #selector(validateName))
        signInView.passwordEditingChanged(self, action: #selector(validatePass))
        signInView.evenSignInBtn(self, action: #selector(btnSignInAction))
        signInView.eventForgetPassword(target: self, action: #selector(forgetPasswordAction))
        
        
        
//        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
//        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UsersCoreData")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//        do
//        {
//            try context.execute(deleteRequest)
//            try context.save()
//        }
//        catch
//        {
//            print ("There was an error")
//        }
        
        
    }
    
    @objc private func validateName(sender: UITextField) {
        login = sender.text!
        signInView.enabledForgotPassword(login: login)
        signInView.enabledSignInBtn(login: login, password: password)
    }
    
    @objc private func forgetPasswordAction(sender: UIButton) {
        let checkLogin = users.forgetPassword(login: login)
        signInView.setInputAlert(title: "Подсказка", message: checkLogin)
        signInView.presentAlert(controller: self)
    }
    
    @objc private func validatePass(sender: UITextField) {
        password = sender.text!
        signInView.enabledSignInBtn(login: login, password: password)
    }
    
    @objc private func btnSignUpAction(sender: UIButton) {
        let rootVC = signUpVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true, completion: nil)
    }
    
    @objc private func btnSignInAction(sender: UIButton) {
        let check = users.checkUser(login: login, password: password)
        
        if check {
            let rootVC = TasksVC()
            rootVC.modalPresentationStyle = .fullScreen
            self.present(rootVC, animated: true)
        } else {
            signInView.setInputAlert(title: "Ошибка при регистрации", message: "Не верный логин или пароль")
            self.signInView.presentAlert(controller: self)
        }
        
//        NetworkService.shared.signInTest(checkUser: checkUser, completion: { success in
//            if success {
//                print(flag, "ok" )
//                let rootVC = TasksVC()
//                rootVC.modalPresentationStyle = .fullScreen
//                self.present(rootVC, animated: true, completion: nil)
//            } else {
//                print(flag)
//                flag = true
//                self.signInView.presentAlert(controller: self)
//            }
//        })
    }
}
