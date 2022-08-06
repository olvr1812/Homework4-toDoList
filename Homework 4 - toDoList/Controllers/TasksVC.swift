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
        tasksView.evenBtnAddTask(self, action: #selector(toAddTask))
        tasksView.tapTypeOfTask(target: self, action: #selector(loadList))
        tasksView.eventLogOut(target: self, action: #selector(logOut))
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @objc private func toAddTask(sender: UIButton) {
        let rootVC = AddTaskVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
    
    @objc func loadList(notification: NSNotification){
        tasksView.realoadDataTasks()
    }
    
    @objc func logOut(sender: UIButton) {
        dismiss(animated: true)
        let rootVC = SignInVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
}

extension TasksVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let typeOfTAsk = tasksView.changedTypeOfTask()
        switch typeOfTAsk {
        case 0:
            return userTasks.readyTasks.count
        case 1:
            return userTasks.inProgressTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        //custom cell
        
        let typeOfTask = tasksView.changedTypeOfTask()
        switch typeOfTask {
        case 0:
            cell.textLabel?.text = userTasks.readyTasks[indexPath.row].name
        case 1:
            cell.textLabel?.text = userTasks.inProgressTasks[indexPath.row].name
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = taskDone(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done])
    }
    
    func taskDone(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "done", handler: { (action, view, complition) in
            userTasks.inProgressTasks[indexPath.row].status = true
            userTasks.addNewTask(task: userTasks.inProgressTasks[indexPath.row], index: indexPath.row)
            self.tasksView.realoadDataTasks()
        })
        action.backgroundColor = UIColor(red: 96/255, green: 197/255, blue: 84/255, alpha: 1)
        return action
    }
    
}

extension TasksVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let typeOfTAsk = tasksView.changedTypeOfTask()
        var name = String()
        var summary = String()
        var status = Bool()
        switch typeOfTAsk {
        case 0:
            name = userTasks.readyTasks[indexPath.row].name
            summary = userTasks.readyTasks[indexPath.row].summary
            status = userTasks.readyTasks[indexPath.row].status
        case 1:
            name = userTasks.inProgressTasks[indexPath.row].name
            summary = userTasks.inProgressTasks[indexPath.row].summary
            status = userTasks.inProgressTasks[indexPath.row].status
        default:
            return
        }
        
        let indexOfTask = indexPath.row
        let rootVC = InfoTaskVC()
        rootVC.getInfo(name: name, summary: summary, index: indexOfTask, status: status)
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
}
