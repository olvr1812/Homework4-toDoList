//
//  ViewController.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 21.07.2022
//

import UIKit
import SnapKit

class SignInView: UIView {
    
    private lazy var backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "colorBackground")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private(set) lazy var wrongRegistration: UIAlertController = {
       let alert = UIAlertController(title: "Ошибка при регистрации", message: "Не верный логин или пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        return alert
    }()
    
    private(set) lazy var signUpButt: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 14)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    private(set) lazy var nameTextField: UITextField = {
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
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.font = UIFont(name: "Times New Roman", size: 16)
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) var forgetPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forget password", for: .normal)
        btn.setTitleColor(UIColor(red: 0.33, green: 0.55, blue: 0.83, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Times New Roman", size: 12)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isEnabled = false
        return btn
    }()
    
    private(set) var signInBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign In", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .disabled)
        btn.titleLabel?.font = UIFont(name: "Times New Roman", size: 20)
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
        setSignUp()
        setNameLabel()
        setNameTextField()
        setPasswordLabel()
        setPasswordTextField()
        setForgetPasswordBtn()
        setSignInBtn()
        setImageBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        setSignUp()
        setNameLabel()
        setNameTextField()
        setPasswordLabel()
        setPasswordTextField()
        setForgetPasswordBtn()
        setSignInBtn()
        setImageBackground()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            self.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    private func setSignUp() {
        self.signUpButt.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        self.signUpButt.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -26).isActive = true
        self.signUpButt.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.signUpButt.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setNameLabel() {
        self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 314).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 65).isActive = true
        self.nameLabel.widthAnchor.constraint(equalToConstant: 34).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setNameTextField() {
        self.nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 329).isActive = true
        self.nameTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 65).isActive = true
        self.nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.nameTextField.widthAnchor.constraint(equalToConstant: 264).isActive = true
    }

    private func setPasswordLabel() {
        self.passwordLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 407).isActive = true
        self.passwordLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 65).isActive = true
        self.passwordLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -269).isActive = true
        self.passwordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setPasswordTextField() {
        self.passwordTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 422).isActive = true
        self.passwordTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 65).isActive = true
        self.passwordTextField.widthAnchor.constraint(equalToConstant: 264).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func setForgetPasswordBtn() {
        self.forgetPasswordBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 482).isActive = true
        self.forgetPasswordBtn.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 65).isActive = true
        self.forgetPasswordBtn.widthAnchor.constraint(equalToConstant: 96).isActive = true
        self.forgetPasswordBtn.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setSignInBtn() {
        self.signInBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -81).isActive = true
        self.signInBtn.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 80).isActive = true
        self.signInBtn.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -81).isActive = true
        self.signInBtn.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }

    private func setImageBackground() {
        self.backImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.backImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func setViews() {
        self.addSubview(self.backImage)
        self.addSubview(self.signUpButt)
        self.addSubview(self.nameLabel)
        self.addSubview(self.nameTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.forgetPasswordBtn)
        self.addSubview(self.signInBtn)
    }

}

