//
//  TasksModel.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 02.08.2022.
//

import Foundation

struct MyTask {
    var name: String
    var discription: String
}

var task1 = MyTask(name: "Таблица задач", discription: "Реализовать в своем проекте табоицу задач в UITableView по принципам MVC")
var task2 = MyTask(name: "Окно входа и регисрации", discription: "Реализовать метод, который добовляет новых пользователей в SignUp и метод который проверяет наличие пользователя в списке пользователей")

var myTasks: [MyTask] = [task1, task2]
