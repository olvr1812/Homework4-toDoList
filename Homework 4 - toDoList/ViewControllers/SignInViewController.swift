//
//  SignInView.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 24.07.2022.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    
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
    }
    
    @objc private func btnSignUpAction(sender: UIButton) {
        let rootVC = signUpVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true, completion: nil)
        }
}
