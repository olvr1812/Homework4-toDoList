//
//  InfoTaskView.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 26.07.2022.
//

import Foundation
import UIKit
import SnapKit

class InfoTaskView: UIView {
    
    private lazy var backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "colorBackground")
        return image
    }()
    
    private lazy var btnBackToTasks: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "rightArrow"), for: .normal)
        return btn
    }()
    
    private lazy var nameTask: UILabel = {
        let label = UILabel()
        label.text = " Бегит 5 киломкеторв"
        label.font = UIFont(name: "Times New Roman", size: 17)
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var deleteTask: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        return btn
    }()
    
    private lazy var summaryTask: UITextView = {
        let label = UITextView()
        label.textColor = UIColor.white
        label.backgroundColor = .clear
        label.isScrollEnabled = false
        label.text = """
 1. Спостел встол
 2. Одежд поддель
 3. Бегит пашуль
 4. Патель
 5. Памыть
"""
        label.font = UIFont(name: "Times New Roman", size: 17)
        label.textAlignment = .justified
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.isUserInteractionEnabled = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setBacgroundIamge()
        setBtnBackToTasks()
        setNameTask()
        setDeleteTask()
        setSummaryTask()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        setBacgroundIamge()
        setBtnBackToTasks()
        setNameTask()
        setDeleteTask()
        setSummaryTask()
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
            maker.right.equalToSuperview().inset(21)
            maker.width.equalTo(20)
            maker.height.equalTo(25)
        })
    }
    
    private func setNameTask() {
        nameTask.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(66)
            maker.right.equalToSuperview().inset(138)
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(58)
            maker.height.equalTo(48)
        })
    }
    
    private func setDeleteTask() {
        deleteTask.snp.makeConstraints({ maker in
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(69)
            maker.right.equalTo(self.safeAreaLayoutGuide).inset(60)
            maker.width.equalTo(32)
            maker.height.equalTo(29)
        })
    }
    
    private func setSummaryTask() {
        summaryTask.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(66)
            maker.right.equalToSuperview().inset(60)
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(155)
            maker.bottom.equalToSuperview().inset(95)
            
        })
    }
    
    func setInfoInTask(name: String, description: String) {
        nameTask.text = name
        summaryTask.text = description
    }
    
    func setViews() {
        self.addSubview(backImage)
        self.addSubview(btnBackToTasks)
        self.addSubview(nameTask)
        self.addSubview(deleteTask)
        self.addSubview(summaryTask)
    }
    
    func evenBackToTasks(_ target: Any?, action: Selector) {
        btnBackToTasks.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func evenDeleteTask(_ target: Any?, action: Selector) {
        deleteTask.addTarget(target, action: action, for: .touchUpInside)
    }
}
