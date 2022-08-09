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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksView.tableViewTasks.dataSource = self
        tasksView.tableViewTasks.delegate = self
        tasksView.btnAddTask.addTarget(self, action: #selector(toAddTask), for: .touchUpInside)
        tasksView.typeOfTasks.addTarget(self, action: #selector(loadList), for: .valueChanged)
        tasksView.btnLogOut.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        userTasksTest.fetchTasks()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @objc private func toAddTask(sender: UIButton) {
        let rootVC = AddTaskVC()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
    
    @objc func loadList(notification: NSNotification){
        tasksView.tableViewTasks.reloadData()
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
        let typeOfTAsk = tasksView.typeOfTasks.selectedSegmentIndex
        switch typeOfTAsk {
        case 0:
            return userTasksTest.inProgressTasks.count
        case 1:
            return userTasksTest.readyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellForTasks
        cell.backgroundColor = .clear
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        let typeOfTask = tasksView.typeOfTasks.selectedSegmentIndex
        switch typeOfTask {
        case 0:
            cell.setLabel(taskName: userTasksTest.inProgressTasks[indexPath.row].name!, deadLineOfTask: userTasksTest.inProgressTasks[indexPath.row].deadline!)
        case 1:
            cell.setLabel(taskName: userTasksTest.readyTasks[indexPath.row].name!, deadLineOfTask: userTasksTest.readyTasks[indexPath.row].deadline!)
        default:
            cell.setLabel(taskName: "", deadLineOfTask: "")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let typeOfTAsk = tasksView.typeOfTasks.selectedSegmentIndex
        
        switch typeOfTAsk {
        case 0:
            let done = taskDone(at: indexPath)
            return UISwipeActionsConfiguration(actions: [done])
        default:
            return UISwipeActionsConfiguration()
        }
    }
    
    func taskDone(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "done", handler: { (action, view, complition) in
            userTasksTest.doneTask(index: indexPath.row)
            self.tasksView.tableViewTasks.reloadData()
        })
        action.backgroundColor = UIColor(red: 96/255, green: 197/255, blue: 84/255, alpha: 1)
        return action
    }
}

extension TasksVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let typeOfTAsk = tasksView.typeOfTasks.selectedSegmentIndex
        var name = String()
        var summary = String()
        var status = Bool()
        switch typeOfTAsk {
        case 0:
            name = userTasksTest.inProgressTasks[indexPath.row].name!
            summary = userTasksTest.inProgressTasks[indexPath.row].summary!
            status = userTasksTest.inProgressTasks[indexPath.row].status
        case 1:
            name = userTasksTest.readyTasks[indexPath.row].name!
            summary = userTasksTest.readyTasks[indexPath.row].summary!
            status = userTasksTest.readyTasks[indexPath.row].status
        default:
            return
        }
        
        let indexOfTask = indexPath.row
        let rootVC = InfoTaskVC()
        rootVC.getInfo(name: name, summary: summary, index: indexOfTask, status: status)
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
