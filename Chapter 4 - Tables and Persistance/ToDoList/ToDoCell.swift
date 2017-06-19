//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Invitado on 6/16/17.
//  Copyright © 2017 AlexOlivares. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: ToDoCell) {
        delegate?.checkmarkTapped(sender: self)
    }
}
