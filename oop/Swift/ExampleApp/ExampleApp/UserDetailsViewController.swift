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
    
    @IBAction func OnSaveButtonTouchUpInside(_ sender: UIButton) {
        guard let name = self.textFieldName.text,
              !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            Util.displayAlert(onView: self, withTitle: "Invalid Name", message: "Please type a valid name.")
            return
        }
        
        let userEditted = User(withName: name, description: "")

        UserController.shared.updateUser(userEditted, onSuccess: updatedSuccessfully, onFail: updatedFailed)
    }
    
    // This method will be called when the controller get the success scenario on update client call
    private func updatedSuccessfully(user: User) {
        Util.displayAlert(onView: self, withTitle: "Success ✅", message: "User \(user.name) udpated successly.")
    }
    
    // This method will be called when the controller get any error on update client call
    private func updatedFailed(errorMessage msg: String) {
        Util.displayAlert(onView: self, withTitle: "Error 🙃", message: msg)
    }
}
