//
//  SignUpVC.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 25.07.2022.
//

import Foundation
import UIKit

class signUpVC: UIViewController {
    
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
    }
    
    @objc private func evenToSignIn(sender: UIButton) {
        dismiss(animated: true)
    }
}
