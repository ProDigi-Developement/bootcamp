//
//  ViewController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FetchDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserController.shared.delegate = self
        UserController.shared.fetchUsers()
    }
    
    func fetchAll(usersList list: [User]) {
        for user in list {
            print(user.toString())
        }
    }

    func fetchFailed(errorMessage msg: String) {        
        print(msg)
    }
}
