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
    
    private lazy var tableViewTasks: UITableView = {
        let tabView = UITableView()
        tabView.backgroundColor = .clear
        tabView.clipsToBounds = true
        tabView.layer.cornerRadius = 10
        tabView.layer.borderWidth = 1
        tabView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        tabView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tabView
    }()
    
    private lazy var items = ["Ready", "In progress"]
    
    private lazy var typeOfTasks: UISegmentedControl = {
        let segment = UISegmentedControl(items: items)
        segment.backgroundColor = UIColor.gray
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        segment.selectedSegmentTintColor = UIColor.black
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private lazy var btnInfoTask: UIButton = {
        let btn = UIButton()
        btn.setTitle("About task", for: .normal)
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
    
    private lazy var btnAddTask: UIButton = {
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
        setTypeOfTasks()
        setTableViewTasks()
        setBtnInfoTask()
        setBtnNewTask()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        setImage()
        setTypeOfTasks()
        setTableViewTasks()
        setBtnInfoTask()
        setBtnNewTask()
    }
    
    private func setImage() {
        backgroundImage.snp.makeConstraints({ maker in
            maker.height.equalToSuperview()
            maker.width.equalToSuperview()
        })
    }
    
    private func setBtnInfoTask() {
        btnInfoTask.snp.makeConstraints({ maker in
            maker.bottom.equalTo(self.btnAddTask).inset(101)
            maker.left.equalToSuperview().inset(80)
            maker.right.equalToSuperview().inset(81)
            maker.height.equalTo(55)
        })
    }
    
    private func setTypeOfTasks() {
        typeOfTasks.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().inset(18)
            maker.right.equalToSuperview().inset(19)
            maker.top.equalToSuperview().inset(73)
            maker.height.equalTo(26)
        })
    }
    
    private func setTableViewTasks() {
        tableViewTasks.snp.makeConstraints({ maker in
            maker.top.equalToSuperview().inset(133)
            maker.width.equalToSuperview()
            maker.height.equalTo(250)
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
    
    func addDataSource(controller: UITableViewDataSource) {
        tableViewTasks.dataSource = controller
    }
    
    func addDelegate(controller: UITableViewDelegate) {
        tableViewTasks.delegate = controller
    }
    
    func realoadDataTasks() {
        tableViewTasks.reloadData()
    }
    
    func setViews() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.tableViewTasks)
        self.addSubview(self.btnAddTask)
        self.addSubview(self.btnInfoTask)
        self.addSubview(self.typeOfTasks)
    }
    
    func evenBtnInfoTask(_ target: Any?, action: Selector) {
        btnInfoTask.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func evenBtnAddTask(_ target: Any?, action: Selector) {
        btnAddTask.addTarget(target, action: action, for: .touchUpInside)
    }
    
    
}



