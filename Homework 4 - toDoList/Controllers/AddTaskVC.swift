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
    private var deadLineOfTask = String()
    
    private var addTaskView: AddTask {
        return self.view as! AddTask
    }
    
    override func loadView() {
        super.loadView()
        self.view = AddTask()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskView.deadlineOfTask.addTarget(self, action: #selector(deadlineHidden), for: .touchUpInside)
        addTaskView.nameTaskTextField.addTarget(self, action: #selector(newNameTask), for: .editingChanged)
        addTaskView.btnAddTask.addTarget(self, action: #selector(addNewTask), for: .touchUpInside)
        addTaskView.btnBackToTasks.addTarget(self, action: #selector(backToTasks), for: .touchUpInside)
    }
    
    @objc private func backToTasks(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func deadlineHidden(sender: UIButton) {
        if addTaskView.setDeadline.isHidden {
            addTaskView.setDeadline.isHidden = false
            } else {
                addTaskView.setDeadline.isHidden = true
            }
    }
    
    @objc private func newNameTask(sender: UITextField) {
        nameTask = " " + sender.text!
    }
    
    @objc private func addNewTask(sender: UIButton) {
        summaryTask = addTaskView.descriptionTaskTextField.text!
        deadLineOfTask = correctDeadLineOfTask()
        userTasksTest.newTask(name: nameTask, summary: summaryTask, deadline: deadLineOfTask)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
    }
    
    private func correctDeadLineOfTask() -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: addTaskView.setDeadline.date)
        let month = calendar.component(.month, from: addTaskView.setDeadline.date)
        let year = calendar.component(.year, from: addTaskView.setDeadline.date) % 100
        let hour = calendar.component(.hour, from: addTaskView.setDeadline.date)
        let minute = calendar.component(.minute, from: addTaskView.setDeadline.date)
        var correctDate = ["\(day)","\(month)", "\(year)", "\(hour)", "\(minute)"]
        correctDate = correctDate.map { Int($0)! / 10 == 0 ? "0" + $0 : $0 }
        
        let deadLine = "\(correctDate[0]).\(correctDate[1]).\(correctDate[2]) \(correctDate[3]):\(correctDate[4])"
        return deadLine
    }
}
