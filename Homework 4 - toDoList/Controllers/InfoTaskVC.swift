//
//  InfoTaskVC.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 26.07.2022.
//

import Foundation
import UIKit

class InfoTaskVC: UIViewController {
    
    private var nameOfTaks = String()
    private var descriptionOfTask = String()
    private var indexOfTask = Int()
    private var statusOfTask = Bool()
    
    private var infoTaskView: InfoTaskView {
        return self.view as! InfoTaskView
    }
    
    override func loadView() {
        super.loadView()
        self.view = InfoTaskView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTaskView.btnBackToTasks.addTarget(self, action: #selector(backToTasks), for: .touchUpInside)
        infoTaskView.deleteTask.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        setInfoInTask(name: nameOfTaks, description: descriptionOfTask)
    }
    
    func getInfo(name: String, summary: String, index: Int, status: Bool) {
        nameOfTaks = name
        descriptionOfTask = summary
        indexOfTask = index
        statusOfTask = status
    }
    
    private func setInfoInTask(name: String, description: String) {
       infoTaskView.nameTask.text = name
       infoTaskView.summaryTask.text = description
    }
    
    @objc private func backToTasks(sander: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func deleteTask(sender: UIButton) {
        userTasksTest.removeTask(index: indexOfTask, status: statusOfTask)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
    }
}
