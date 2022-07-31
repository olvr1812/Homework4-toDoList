//
//  SignInView.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 24.07.2022.
//

import Foundation
import UIKit

class SignInVC: UIViewController {
    
    private var user: User?
    private lazy var login: String = ""
    private lazy var password: String = ""
    
    private var signInView: SignInView {
        return self.view as! SignInView
    }
    
    override func loadView() {
        super.loadView()
        self.view = SignInView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.evenToSignUp(self, action: #selector(btnSignUpAction))
        signInView.nameEditingChange(self, action: #selector(validateName))
        signInView.passwordEditingChanged(self, action: #selector(validatePass))
        signInView.evenSignInBtn(self, action: #selector(btnSignInAction))
    }
    
    @objc private func btnSignUpAction(sender: UIButton) {
        let rootVC = signUpVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true, completion: nil)
    }
    
    @objc private func validateName(sender: UITextField) {
        login = sender.text!
        signInView.enabledSignInBtn(login: login, password: password)
    }
    
    @objc private func validatePass(sender: UITextField) {
        password = sender.text!
        signInView.enabledSignInBtn(login: login, password: password)
    }
    
    @objc private func btnSignInAction(sender: UIButton) {
        NetworkService.shared.signIn(login: login, password: password, completion: { success in
            if success {
                print("Вход успешно выполнен!")
//                self.dismiss(animated: true)
                let rootVC = TasksVC()
                rootVC.modalPresentationStyle = .fullScreen
                self.present(rootVC, animated: true, completion: nil)
            } else {
                print("Не верный логин и/или пароль")
            }
        })
    }
}
