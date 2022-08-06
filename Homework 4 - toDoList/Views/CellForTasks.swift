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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setNameTask()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        addViews()
        setNameTask()
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
    
    func setLabel(taskName: String) {
        nameTask.text = taskName
    }
    
    private func addViews() {
        self.addSubview(nameTask)
    }
}
