//
//  AddTaskVC.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 28.07.2022.
//

import Foundation
import UIKit

class AddTaskVC: UIViewController {
    
    private var nameTask = String()
    private var summaryTask = String()
    
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
        addTaskView.editNameTask(self, action: #selector(newNameTask))
        addTaskView.editSummaryTask(self, action: #selector(newSummaryTask))
        addTaskView.addNewTask(self, action: #selector(addNewTask))
    }
    
    @objc private func backToTasks(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func newNameTask(sender: UITextField) {
        nameTask = sender.text!
    }
    
    @objc private func newSummaryTask(sender: UITextView) {
        print(sender.text!)
        summaryTask = sender.text!
    }
    
    
    @objc private func addNewTask(sender: UIButton) {
        myTasks.append(MyTask(name: nameTask, discription: summaryTask))
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
    }
}
