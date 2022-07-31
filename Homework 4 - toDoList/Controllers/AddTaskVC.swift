//
//  AddTaskVC.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 28.07.2022.
//

import Foundation
import UIKit

class AddTaskVC: UIViewController {
    
    private var addTaskView: AddTask {
        return self.view as! AddTask
    }
    
    override func loadView() {
        super.loadView()
        self.view = AddTask()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskView.evenBackToTasks(self, action: #selector(backToTasks))
    }
    
    @objc private func backToTasks(sender: UIButton) {
        dismiss(animated: true)
    }
}
