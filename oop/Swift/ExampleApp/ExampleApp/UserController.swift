//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class UserController {
    var userList: [User]
    
    // MARK: Singleton
    static let shared: UserController = {
        let instance = UserController()
        return instance
    }()
    
    private init() {
        self.userList = [User]()
    }
    
    func getUsers() {
        
    }
}
