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
        tasksView.addDataSource(controller: self)
        tasksView.addDelegate(controller: self)
        tasksView.evenBtnInfoTask(self, action: #selector(toInfoTask))
        tasksView.evenBtnAddTask(self, action: #selector(toAddTask))
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
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
    
    @objc func loadList(notification: NSNotification){
        tasksView.realoadDataTasks()
    }
}

extension TasksVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myTasks[indexPath.row].name
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
}

extension TasksVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Work")
        let name = myTasks[indexPath.row].name
        let summary = myTasks[indexPath.row].discription
        let indexOfTask = indexPath.row
        let rootVC = InfoTaskVC()
        rootVC.getInfo(name: name, summary: summary, index: indexOfTask)
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
}
