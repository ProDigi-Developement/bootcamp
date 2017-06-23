//
//  ViewController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let segueId: String = "showUser"
    var userSelected: User!
    var editUser: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Setup the tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // MARK: Setup the UserController
        UserController.shared.delegate = self
        
        UserController.shared.fetchUsers()
    }
    
    func handleError(message: String) {
        print("Error: \(message)")
        
        Util.displayAlert(onView: self, withTitle: "Error 🙃", message: message)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == self.segueId) {
            guard let detailsVC = segue.destination as? UserDetailsViewController else {
                print("Not possible to convert the segue")
                return
            }
            
            // Set the values for UserDetailsViewController
            detailsVC.userSelected = self.userSelected
            detailsVC.allowEdit = self.editUser
            
            // Return the value to the default value
            self.editUser = false
        }
    }
}

extension ViewController: FetchDelegate {
    // This is the success delegate method
    func fetchedAllUsers() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // This is the fail delegate method
    func fetchUsersFailed(errorMessage msg: String) {
        self.handleError(message: msg)
    }
    
    // This method will be called when the controller get the success scenario on update client call
    func updatedSuccessfully(user: User) {
        // TODO: 
    }

    // This method will be called when the controller get any error on update client call
    func updatedFailed(errorMessage msg: String) {
        self.handleError(message: msg)
    }
    
    // This method will be called when the controller get the success scenario on delete client call
    func deletedSuccessfully(user: User) {
        // TODO:
    }
    
    // This method will be called when the controller get any error on delete client call
    func deletedFailed(errorMessage msg: String) {
        self.handleError(message: msg)
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
        self.performSegue(withIdentifier: self.segueId, sender: self)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteBtn = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            let _ = UserController.shared.userList[indexPath.row]
            // TODO: call delete action
        }
        
        let editBtn = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.editUser = true
            self.userSelected = UserController.shared.userList[indexPath.row]
            self.performSegue(withIdentifier: self.segueId, sender: self)
        }
        
        return [editBtn, deleteBtn]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

