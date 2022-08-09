//
//  SignUpVC.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 25.07.2022.
//

import Foundation
import UIKit
import CoreData

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
        signUpView.btnToSignIn.addTarget(self, action: #selector(eventToSignIn), for: .touchUpInside)
        signUpView.nameTextField.addTarget(self, action: #selector(validateName), for: .editingChanged)
        signUpView.passwordTextField.addTarget(self, action: #selector(validatePass), for: .editingChanged)
        signUpView.signIUpBtn.addTarget(self, action: #selector(eventSignUp), for: .touchUpInside)
    }
    
    @objc private func eventToSignIn(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func validateName(sender: UITextField) {
        login = sender.text!
        signUpView.signIUpBtn.isEnabled = login != "" && password != ""
    }
    
    @objc private func validatePass(sender: UITextField) {
        password = sender.text!
        signUpView.signIUpBtn.isEnabled = login != "" && password != ""
    }
    
    @objc private func eventSignUp(sender: UIButton) {
        let check = users.checkNewUser(newLogin: login)
        
        if !check {
            print(users.users.count)
            users.newUser(login: login, password: password)
            dismiss(animated: true)
        } else {
            self.present(signUpView.wrongUserName, animated: true)
        }
        
    }
}
