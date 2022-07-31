//
//  TasksVC.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 26.07.2022.
//

import Foundation
import UIKit


class TasksVC: UIViewController {
    
    private var tasksView: TasksView {
        return self.view as! TasksView
    }
    
    override func loadView() {
        super.loadView()
        self.view = TasksView()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksView.evenBtnInfoTask(self, action: #selector(toInfoTask))
        tasksView.evenBtnAddTask(self, action: #selector(toAddTask))
    }
    
    @objc private func toInfoTask(sender: UIButton) {
        let rootVC = InfoTaskVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
    
    @objc private func toAddTask(sender: UIButton) {
        let rootVC = AddTaskVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
}
