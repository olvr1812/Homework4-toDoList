//
//  CellForTasks.swift
//  Homework 4 - toDoList
//
//  Created by Оливер Салихов on 06.08.2022.
//

import Foundation
import UIKit
import SnapKit

class CellForTasks: UITableViewCell {
    
    private lazy var nameTask: UILabel = {
       let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = .white
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    private lazy var deadlineLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.textColor = .white
        lbl.text = ""
        lbl.textAlignment = .center
//        lbl.clipsToBounds = true
//        lbl.layer.cornerRadius = 10
        lbl.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.layer.borderWidth = 1
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setNameTask()
        setDeadlineLbl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        addViews()
        setNameTask()
        setDeadlineLbl()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setNameTask() {
        nameTask.snp.makeConstraints( { maker in
            maker.top.equalToSuperview().inset(5)
            maker.bottom.equalToSuperview().inset(5)
            maker.left.equalToSuperview().inset(5)
            maker.width.equalTo(300)
        })
    }
    
    private func setDeadlineLbl() {
        deadlineLabel.snp.makeConstraints( { maker in
            maker.top.equalToSuperview().inset(18)
            maker.bottom.equalToSuperview().inset(18)
            maker.right.equalToSuperview().inset(10)
            maker.width.equalTo(120)
        })
    }
    
    func setLabel(taskName: String, deadLineOfTask: String) {
        nameTask.text = taskName
        deadlineLabel.text = deadLineOfTask
    }
    
    private func addViews() {
        self.addSubview(nameTask)
        self.addSubview(deadlineLabel)
    }
}
