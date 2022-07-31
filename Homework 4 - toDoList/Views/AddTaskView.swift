//
//  AddTaskView.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 28.07.2022.
//

import Foundation
import UIKit

class AddTask: UIView {
    
    private lazy var backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "colorBackground")
        return image
    }()
    
    private lazy var btnBackToTasks: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        return btn
    }()
    
    private lazy var clockOfTask: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "clock"), for: .normal)
        return btn
    }()
    
    private lazy var nameTaskLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTaskTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.font = UIFont(name: "Times New Roman", size: 14)
        textField.textColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var descriptionTaskLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont(name: "Times New Roman", size: 12)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionTaskTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.font = UIFont(name: "Times New Roman", size: 14)
        textField.textColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var btnAddTask: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Times New Roman", size: 15)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .disabled)
        btn.backgroundColor = .init(red: 0.07, green: 0.19, blue: 0.27, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0
        btn.contentHorizontalAlignment = .center
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setBacgroundIamge()
        setBtnBackToTasks()
        setClockOfTask()
        setNameTaskLabel()
        setTaskNameTextField()
        setDescriptionTaskLabel()
        setTaskDescriptionTextField()
        setBtnNewTask()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        setBacgroundIamge()
        setBtnBackToTasks()
        setClockOfTask()
        setNameTaskLabel()
        setTaskNameTextField()
        setDescriptionTaskLabel()
        setTaskDescriptionTextField()
        setBtnNewTask()
    }
    
    private func setBacgroundIamge() {
        backImage.snp.makeConstraints({ maker in
            maker.height.equalToSuperview()
            maker.width.equalToSuperview()
        })
    }
    
    private func setBtnBackToTasks() {
        btnBackToTasks.snp.makeConstraints({ maker in
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(28)
            maker.left.equalToSuperview().inset(21)
            maker.width.equalTo(20)
            maker.height.equalTo(25)
        })
    }
    
    private func setClockOfTask() {
        clockOfTask.snp.makeConstraints({ maker in
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(53)
            maker.right.equalToSuperview().inset(33)
            maker.width.equalTo(28)
            maker.height.equalTo(28)
        })
    }
    
    private func setNameTaskLabel() {
        nameTaskLabel.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(63)
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(112)
            maker.width.equalTo(25)
            maker.height.equalTo(15)
        })
    }
    
    private func setTaskNameTextField() {
        nameTaskTextField.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(63)
            maker.right.equalToSuperview().inset(63)
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(127)
            maker.height.equalTo(50)
        })
    }
    
    private func setDescriptionTaskLabel() {
        descriptionTaskLabel.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(63)
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(198)
            maker.width.equalTo(65)
            maker.height.equalTo(15)
        })
    }
    
    private func setTaskDescriptionTextField() {
        descriptionTaskTextField.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(63)
            maker.right.equalToSuperview().inset(63)
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(219)
            maker.bottom.equalTo(self.safeAreaLayoutGuide).inset(164)
        })
    }
    
    private func setBtnNewTask() {
        btnAddTask.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(81)
            maker.right.equalToSuperview().inset(80)
            maker.bottom.equalToSuperview().inset(55)
            maker.height.equalTo(55)
        })
    }
    
    private func setViews() {
        addSubview(backImage)
        addSubview(btnBackToTasks)
        addSubview(clockOfTask)
        addSubview(nameTaskLabel)
        addSubview(nameTaskTextField)
        addSubview(descriptionTaskLabel)
        addSubview(descriptionTaskTextField)
        addSubview(btnAddTask)
    }
    
    func evenBackToTasks(_ target: Any?, action: Selector) {
        btnBackToTasks.addTarget(target, action: action, for: .touchUpInside)
    }
}
