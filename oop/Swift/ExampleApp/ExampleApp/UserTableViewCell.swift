//
//  UserTableViewCell.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet private weak var labelName: UILabel!
    
    func fillCell(withUser user: User) {
        self.labelName.text = user.name
    }
}
