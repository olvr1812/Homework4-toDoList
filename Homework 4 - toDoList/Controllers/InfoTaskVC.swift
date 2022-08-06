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
        infoTaskView.evenBackToTasks(self, action: #selector(backToTasks))
        infoTaskView.evenDeleteTask(self, action: #selector(deleteTask))
        infoTaskView.setInfoInTask(name: nameOfTaks, description: descriptionOfTask)
    }
    
    func getInfo(name: String, summary: String, index: Int, status: Bool) {
        nameOfTaks = name
        descriptionOfTask = summary
        indexOfTask = index
        statusOfTask = status
    }
    
    @objc private func backToTasks(sander: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func deleteTask(sender: UIButton) {
        userTasks.removeTask(status: statusOfTask, index: indexOfTask)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
    }
}
