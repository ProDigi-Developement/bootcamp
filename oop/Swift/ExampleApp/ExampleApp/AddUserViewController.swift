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
        }
    }
    
    private func validateInput() -> Bool {
        return true
    }
}
