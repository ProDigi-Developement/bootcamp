//
//  AddUserViewController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-26.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addButtonTouchUpInside(_ sender: Any) {
        if validateInput() {
            let newUser = User(withName: self.textFieldName.text!, description: self.textFieldDescription.text!)
            UserController.shared.addUser(newUser, onSuccess: addSuccess, onFail: addFail)
        }
    }
    
    private func validateInput() -> Bool {
        return true
    }
    
    // MARK: Callbacks for add new user
    
    private func addSuccess() {
        Util.displayAlert(onView: self, withTitle: "Success", message: "New user added successfully.")
    }
    
    private func addFail(errorMessage: String) {
        Util.displayAlert(onView: self, withTitle: "Fail", message: "New user not added.")
    }
}
