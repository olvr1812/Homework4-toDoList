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
        signInView.signUpButt.addTarget(self, action: #selector(btnSignUpAction), for: .touchUpInside)
        signInView.nameTextField.addTarget(self, action: #selector(validateName), for: .editingChanged)
        signInView.passwordTextField.addTarget(self, action: #selector(validatePass), for: .editingChanged)
        signInView.signInBtn.addTarget(self, action: #selector(btnSignInAction), for: .touchUpInside)
        signInView.forgetPasswordBtn.addTarget(self, action: #selector(forgetPasswordAction), for: .touchUpInside)
        
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
        signInView.forgetPasswordBtn.isEnabled = login != ""
        signInView.signInBtn.isEnabled = login != "" && password != ""
    }
    
    @objc private func forgetPasswordAction(sender: UIButton) {
        let checkLogin = users.forgetPassword(login: login)
        signInView.wrongRegistration.title = "Подсказка"
        signInView.wrongRegistration.message = checkLogin
        self.present(signInView.wrongRegistration, animated: true)
    }
    
    @objc private func validatePass(sender: UITextField) {
        password = sender.text!
        signInView.signInBtn.isEnabled = login != "" && password != ""
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
            signInView.wrongRegistration.title = "Ошибка при регистрации"
            signInView.wrongRegistration.message = "Не верный логин или пароль"
            self.present(signInView.wrongRegistration, animated: true)
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
