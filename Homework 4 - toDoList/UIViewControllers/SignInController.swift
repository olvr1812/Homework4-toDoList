//
//  ViewController.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 21.07.2022.
//

import UIKit

class SignInController: UIViewController {
    
    
    
    private lazy var signUpButt: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 14)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(btnSignUpAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.frame = CGRect(x: 338, y: 72, width: 56, height: 18)
        return button
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
        textField.font = UIFont(name: "Inter", size: 14)
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private var forgetPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forget password", for: .normal)
        btn.setTitleColor(UIColor(red: 0.33, green: 0.55, blue: 0.83, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Inter", size: 12)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var signInBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign In", for: .normal)
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
        view.addSubview(signUpButt)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(forgetPasswordBtn)
        view.addSubview(signInBtn)
        setSignUp()
        setNameLabel()
        setNameTextField()
        setPasswordTextField()
        setPasswordLabel()
        setForgetPasswordBtn()
        setSignInBtn()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
            
    }
    
    private func setSignUp() {
        signUpButt.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        signUpButt.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -26).isActive = true
        signUpButt.widthAnchor.constraint(equalToConstant: 56).isActive = true
        signUpButt.heightAnchor.constraint(equalToConstant: 18).isActive = true
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
        passwordLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -61).isActive = true
//        passwordLabel.widthAnchor.constraint(equalToConstant: 56).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setPasswordTextField() {
        passwordTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 422).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 264).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setForgetPasswordBtn() {
        forgetPasswordBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 482).isActive = true
        forgetPasswordBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65).isActive = true
        forgetPasswordBtn.widthAnchor.constraint(equalToConstant: 96).isActive = true
        forgetPasswordBtn.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setSignInBtn() {
        signInBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -81).isActive = true
        signInBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80).isActive = true
        signInBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -81).isActive = true
        signInBtn.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    
    
    @objc private func btnSignUpAction(sender: UIButton) {
        let rootVC = SignUpController()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true, completion: nil)
    }
}

