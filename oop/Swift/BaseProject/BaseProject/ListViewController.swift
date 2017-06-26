//
//  ViewController.swift
//  BaseProject
//
//  Created by Caio Dias on 2017-06-22.
//  Copyright © 2017 ProDigi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let segueId: String = "showDetails"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

// MARK: Table View Data Source

extension ListViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CustomController.sharedInstance.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customObj = CustomController.sharedInstance.list[indexPath.row]
        let rawCell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: CustomTableViewCell.self, options: nil)?.first
        
        guard let customCell = rawCell as? CustomTableViewCell else {
            print("Not possible convert the cell to CustomTableViewCell Cell")
            return rawCell as! UITableViewCell
        }
        
        customCell.fillCell(withObject: customObj)
        
        return customCell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CustomController.sharedInstance.selectedUser = CustomController.sharedInstance.list[indexPath.row]
        self.performSegue(withIdentifier: self.segueId, sender: self)
    }
}
