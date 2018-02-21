//
//  CustomTableViewCell.swift
//  BaseProject
//
//  Created by Caio Dias on 2017-06-22.
//  Copyright © 2017 ProDigi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet private weak var labelName: UILabel!
    
    public func fillCell(withPerson person: Person) {
        self.labelName.text = person.fullName
    }
}
