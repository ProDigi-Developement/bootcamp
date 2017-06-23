//
//  ViewController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FetchDelegate {
    @IBOutlet weak var tableView: UITableView!
    var userSelected: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Setup the tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // MARK: Setup the UserController
        UserController.shared.delegate = self
        
        UserController.shared.fetchUsers()
    }
    
    // This is the success delegate method
    func fetchAll() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // This is the fail delegate method
    func fetchFailed(errorMessage msg: String) {        
        print(msg)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserController.shared.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = UserController.shared.userList[indexPath.row]
        let rawCell = Bundle.main.loadNibNamed("UserUITableViewCell", owner: UserUITableViewCell.self, options: nil)?.first
        
        guard let userCell = rawCell as? UserUITableViewCell else {
            print("Not possible convert the cell to UserTableViewCell object")
            return rawCell as! UITableViewCell
        }

        userCell.fillCell(withUser: user)
        
        return userCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.userSelected = UserController.shared.userList[indexPath.row]
        print("User Selected: \(self.userSelected.toString())")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            let _ = UserController.shared.userList[indexPath.row]
            // TODO: call delete action
        }
        delete.backgroundColor = .red
        
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

