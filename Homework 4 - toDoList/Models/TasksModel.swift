//
//  TasksModel.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 02.08.2022.
//

import Foundation
import CoreData
import UIKit


struct MyTask {
    var name: String
    var summary: String
    var deadLine: String
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

class UserTasks {
    var allTasks = [UserTask]()
    var inProgressTasks = [UserTask]()
    var readyTasks = [UserTask]()
    
    func setContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func fetchTasks() {
        let context = setContext()
        let fetchRequest: NSFetchRequest<UserTask> = UserTask.fetchRequest()
        
        
        do {
            allTasks = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        inProgressTasks = allTasks.filter( { $0.status == false })
        readyTasks = allTasks.filter( { $0.status == true })
    }
    
    func newTask(name: String, summary: String, deadline: String) {
        print("work!!!")
        let context = setContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "UserTask", in: context) else { return }
        let newTask = UserTask(entity: entity, insertInto: context)
        newTask.name = name
        newTask.summary = summary
        newTask.deadline = deadline
        newTask.status = false
        inProgressTasks.append(newTask)
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func doneTask(index: Int) {
        inProgressTasks[index].status = true
        readyTasks.append(inProgressTasks[index])
        inProgressTasks.remove(at: index)
    }
    
    func removeTask(index: Int, status: Bool) {
        if status {
            readyTasks.remove(at: index)
        } else {
            inProgressTasks.remove(at: index)
        }
    }
    
    
}
