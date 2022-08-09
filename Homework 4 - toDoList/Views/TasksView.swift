//
//  TasksView.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 26.07.2022.
//

import Foundation
import UIKit
import SnapKit


class TasksView: UIView {
    
    private var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "colorBackground")
        return image
    }()
    
    private(set) lazy var btnLogOut: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log Out", for: .normal)
        btn.backgroundColor = .clear
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Times New Roman", size: 14)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.contentHorizontalAlignment = .center
        return btn
    }()
    
    private(set) lazy var tableViewTasks: UITableView = {
        let tabView = UITableView()
        tabView.backgroundColor = .clear
        tabView.clipsToBounds = true
        tabView.layer.cornerRadius = 10
        tabView.layer.borderWidth = 1
        tabView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        tabView.register(CellForTasks.self, forCellReuseIdentifier: "cell")
        return tabView
    }()
    
    private lazy var items = ["In progress", "Ready"]
    
    private(set) lazy var typeOfTasks: UISegmentedControl = {
        let segment = UISegmentedControl(items: items)
        segment.backgroundColor = UIColor.gray
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        segment.selectedSegmentTintColor = UIColor.black
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private(set) lazy var btnAddTask: UIButton = {
        let btn = UIButton()
        btn.setTitle("ADD TASK", for: .normal)
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
        setImage()
        setLogOut()
        setTypeOfTasks()
        setTableViewTasks()
        setBtnNewTask()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        setImage()
        setLogOut()
        setTypeOfTasks()
        setTableViewTasks()
        setBtnNewTask()
    }
    
    private func setImage() {
        backgroundImage.snp.makeConstraints({ maker in
            maker.height.equalToSuperview()
            maker.width.equalToSuperview()
        })
    }
    
    private func setLogOut() {
        btnLogOut.snp.makeConstraints( { maker in
            maker.top.equalTo(self.safeAreaLayoutGuide).inset(28)
            maker.right.equalToSuperview().inset(26)
            maker.width.equalTo(56)
            maker.height.equalTo(18)
        })
    }
    
    private func setTypeOfTasks() {
        typeOfTasks.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(18)
            maker.right.equalToSuperview().inset(19)
            maker.top.equalToSuperview().inset(108)
            maker.height.equalTo(26)
        })
    }
    
    private func setTableViewTasks() {
        tableViewTasks.snp.makeConstraints({ maker in
            maker.top.equalToSuperview().inset(168)
            maker.width.equalToSuperview()
            maker.bottom.equalTo(btnAddTask.snp_topMargin).inset(-50)
        })
    }
    
    private func setBtnNewTask() {
        btnAddTask.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(80)
            maker.right.equalToSuperview().inset(81)
            maker.bottom.equalToSuperview().inset(81)
            maker.height.equalTo(55)
        })
    }
    
    func setViews() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.btnLogOut)
        self.addSubview(self.tableViewTasks)
        self.addSubview(self.btnAddTask)
        self.addSubview(self.typeOfTasks)
    }
}



