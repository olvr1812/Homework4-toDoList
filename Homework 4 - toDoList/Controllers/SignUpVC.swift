//
//  SignUpVC.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 25.07.2022.
//

import Foundation
import UIKit

class signUpVC: UIViewController {
    
    private lazy var login: String = ""
    private lazy var password: String = ""
    
    private var signUpView: SignUpView {
        return self.view as! SignUpView
    }
    
    override func loadView() {
        super.loadView()
        self.view = SignUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.evenToSignIn(self, action: #selector(evenToSignIn))
        signUpView.nameEditingChange(self, action: #selector(validateName))
        signUpView.passwordEditingChanged(self, action: #selector(validatePass))
        signUpView.evenSignUp(self, action: #selector(evenSignUp))
    }
    
    @objc private func evenToSignIn(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func validateName(sender: UITextField) {
        login = sender.text!
        signUpView.enabledSignInBtn(login: login, password: password)
    }
    
    @objc private func validatePass(sender: UITextField) {
        password = sender.text!
        signUpView.enabledSignInBtn(login: login, password: password)
    }
    
    @objc private func evenSignUp(sender: UIButton) {
        users.append(User(login: login, password: password))
        print(users.count)
        dismiss(animated: true)
    }
}
