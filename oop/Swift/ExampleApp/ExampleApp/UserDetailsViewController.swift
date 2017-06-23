//
//  UserDetailsViewController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-23.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    @IBOutlet private weak var textFieldName: UITextField!
    var userSelected: User? = nil
    var allowEdit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let userUnwrapped = self.userSelected {
            self.textFieldName.text = userUnwrapped.name
        }
        
        self.textFieldName.isEnabled = self.allowEdit
    }
}
