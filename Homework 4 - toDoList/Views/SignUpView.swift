//
//  SignUp.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 21.07.2022.
//

import Foundation
import UIKit

class SignUpView: UIView {
    
    private var backgorundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "colorBackground")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var wrongUserName: UIAlertController = {
        let alert = UIAlertController(title: "Не верный логин", message: "Пользователь с таким именем уже существует", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        return alert
    }()
    
    private lazy var btnToSignIn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.font = UIFont(name: "Times New Roman", size: 16)
        textField.textColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Times New Roman", size: 16)
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.isSecureTextEntry = true
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signIUpBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .disabled)
        btn.titleLabel?.font = UIFont(name: "Times New Roman", size: 15)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.backgroundColor = .init(red: 0.07, green: 0.19, blue: 0.27, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0
        btn.contentHorizontalAlignment = .center
        btn.isEnabled = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setBackgroundImage()
        setBtnToSignIn()
        setNameLabel()
        setNameTextField()
        setPasswordLabel()
        setPasswordTextField()
        setSignUpBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBackgroundImage()
        setViews()
        setBtnToSignIn()
        setNameLabel()
        setNameTextField()
        setPasswordLabel()
        setPasswordTextField()
        setSignUpBtn()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            self.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    private func setBtnToSignIn() {
        self.btnToSignIn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 21).isActive = true
        self.btnToSignIn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22).isActive = true
        self.btnToSignIn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        self.btnToSignIn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setNameLabel() {
        self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 314).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 65).isActive = true
        self.nameLabel.widthAnchor.constraint(equalToConstant: 34).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setNameTextField() {
        self.nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 329).isActive = true
        self.nameTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 65).isActive = true
        self.nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.nameTextField.widthAnchor.constraint(equalToConstant: 264).isActive = true
    }

    private func setPasswordLabel() {
        self.passwordLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 407).isActive = true
        self.passwordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 65).isActive = true
        self.passwordLabel.widthAnchor.constraint(equalToConstant: 56).isActive = true
        self.passwordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setPasswordTextField() {
        self.passwordTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 422).isActive = true
        self.passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 65).isActive = true
        self.passwordTextField.widthAnchor.constraint(equalToConstant: 264).isActive = true
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setSignUpBtn() {
        self.signIUpBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -81).isActive = true
        self.signIUpBtn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 80).isActive = true
        self.signIUpBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -81).isActive = true
        self.signIUpBtn.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func setBackgroundImage() {
        self.backgorundImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.backgorundImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func evenToSignIn(_ target: Any?, action: Selector) {
        btnToSignIn.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func nameEditingChange(_ target: Any?, action: Selector) {
        nameTextField.addTarget(target, action: action, for: .editingChanged)
    }
    
    func passwordEditingChanged(_ target: Any?, action: Selector) {
        passwordTextField.addTarget(target, action: action, for: .editingChanged)
    }
    
    func evenSignUp(_ target: Any?, action: Selector) {
        signIUpBtn.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func enabledSignInBtn(login: String, password: String) {
        if password != "" && login != "" {
            signIUpBtn.isEnabled = true
        } else {
            signIUpBtn.isEnabled = false
        }
    }
    
    func addAlert(controller: UIViewController) {
        controller.present(wrongUserName, animated: true, completion: nil)
    }
    
    func setViews() {
        self.addSubview(backgorundImage)
        self.addSubview(btnToSignIn)
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(signIUpBtn)
    }
}
