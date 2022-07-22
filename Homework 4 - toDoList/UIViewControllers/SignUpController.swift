//
//  SignUp.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 21.07.2022.
//

import Foundation
import UIKit

class SignUpController: UIViewController {
    
    private var btnToSignIn: UIButton = {
        let btn = UIButton()
        btn.setTitle("<-", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Inter", size: 20)
        btn.addTarget(self, action: #selector(evenToSignIn), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        
        return btn
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        label.textColor = .black
        label.font = UIFont(name: "Inter", size: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        textField.font = UIFont(name: "Inter", size: 14)
        textField.textColor = .black
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        label.textColor = .black
        label.font = UIFont(name: "Inter", size: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        textField.font = UIFont(name: "Inter", size: 14)
        textField.textColor = .black
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private var signIUpBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Inter", size: 15)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.backgroundColor = .init(red: 0.98, green: 0.905, blue: 0.905, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0
        btn.contentHorizontalAlignment = .center
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(btnToSignIn)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signIUpBtn)

        setBtnToSignIn()
        setNameLabel()
        setNameTextField()
        setPasswordLabel()
        setPasswordTextField()
        setSignUpBtn()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first as? UITouch {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
            
    }

    private func setNameLabel() {
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 314).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 34).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setNameTextField() {
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 329).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 264).isActive = true
    }

    private func setPasswordLabel() {
        passwordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 407).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 56).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setPasswordTextField() {
        passwordTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 422).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 264).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setBtnToSignIn() {
        btnToSignIn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21).isActive = true
        btnToSignIn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22).isActive = true
        btnToSignIn.widthAnchor.constraint(equalToConstant: 27).isActive = true
        btnToSignIn.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    private func setSignUpBtn() {
        signIUpBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600).isActive = true
        signIUpBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80).isActive = true
        signIUpBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -81).isActive = true
        signIUpBtn.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    @objc private func evenToSignIn(sender: UIButton) {
        dismiss(animated: true)
        let rootVC = SignInController()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true, completion: nil)
    }
}
