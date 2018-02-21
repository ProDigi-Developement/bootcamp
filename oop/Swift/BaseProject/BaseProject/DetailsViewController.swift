//
//  DetailsViewController.swift
//  BaseProject
//
//  Created by Caio Dias on 2017-06-26.
//  Copyright © 2017 ProDigi. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textFieldName.isUserInteractionEnabled = false
    }
    
    // When this screen will appear, if there is any instance on selectedCustomObject, fill the screen textField with it
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedUser = PersonController.sharedInstance.selectedUser {
            self.textFieldName.text = selectedUser.fullName
        }
    }
}
