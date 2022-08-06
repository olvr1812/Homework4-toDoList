//
//  TasksModel.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 02.08.2022.
//

import Foundation



struct MyTask {
    var name: String
    var summary: String
    var status: Bool = false
}

class MyTasks {
    var inProgressTasks = [MyTask]()
    var readyTasks = [MyTask]()
    
    func addNewTask(task: MyTask, index: Int) {
        if !task.status {
            inProgressTasks.append(task)
        } else {
            readyTasks.append(inProgressTasks[index])
            inProgressTasks.remove(at: index)
        }
    }
    
    func removeTask(status: Bool, index: Int) {
        if status {
            readyTasks.remove(at: index)
        } else {
            inProgressTasks.remove(at: index)
        }
    }
}
