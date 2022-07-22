//
//  SignProtocol.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 21.07.2022.
//

import Foundation
import UIKit

protocol Sign {
    var nameLabel: UILabel { get }
    var nameTextField: UITextField { get }
    var passwordLabel: UILabel { get }
    var passwordTextField: UITextField { get }
}
