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
    @IBOutlet private weak var textFieldDescription: UITextField!
    @IBOutlet private weak var buttonSave: UIButton!
    var userSelected: User? = nil
    var allowEdit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let userUnwrapped = self.userSelected {
            self.textFieldName.text = userUnwrapped.name
            self.textFieldDescription.text = userUnwrapped.description
        }
        
        self.textFieldName.isEnabled = self.allowEdit
        self.textFieldDescription.isEnabled = self.allowEdit
        self.buttonSave.isHidden = !self.allowEdit
    }
    
    @IBAction func OnSaveButtonTouchUpInside(_ sender: UIButton) {
        guard let name = self.textFieldName.text,
              !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              let description = self.textFieldDescription.text,
              !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            Util.displayAlert(onView: self, withTitle: "Invalid Input", message: "Please type a valid value for name or description.")
            return
        }
        
        self.userSelected?.name = name
        self.userSelected?.description = description

//        UserController.shared.updateUser(self.userSelected!, onSuccess: updatedSuccessfully, onFail: updatedFailed)
    }
    
//    // This method will be called when the controller get the success scenario on update client call
//    private func updatedSuccessfully() {
//        Util.displayAlert(onView: self, withTitle: "Success ✅", message: "User udpated successly.")
//    }
//    
//    // This method will be called when the controller get any error on update client call
//    private func updatedFailed(errorMessage msg: String) {
//        Util.displayAlert(onView: self, withTitle: "Error 🙃", message: msg)
//    }
}
