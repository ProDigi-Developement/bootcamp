//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class UserController: FetchDelegate {
    private var userList: [User]
    private let api: ApiFetch
    
    // MARK: Singleton
    static let shared: UserController = {
        let instance = UserController()
        return instance
    }()
    
    private init() {
        self.userList = [User]()
        self.api = ApiFetch()
        self.api.delegate = self
    }
    
    func getUsers() {
        
    }
    
    func fetchAll(usersList list: [User]) {
        
    }

    func fetchFailed(errorMessage msg: String) {
        
    }
}
