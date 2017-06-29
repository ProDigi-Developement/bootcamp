//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation
import SystemConfiguration

public final class UserController {
    public private(set) var userList: [User]
    
    // MARK: Singleton
    
    public static let shared: UserController = {
        let instance = UserController()
        return instance
    }()
    
    // Private Controller constructor due to implementation of Singleton Design Pattern
    
    private init() {
        // Stub code
        let userA = User(withName: "Stub1", description: "Stub 1 Description", objectId: "1")
        let userB = User(withName: "Stub2", description: "Stub 2 Description", objectId: "2")
        let userC = User(withName: "Stub3", description: "Stub 3 Description", objectId: "3")
        
        self.userList = [userA, userB, userC]
    }
    
    // MARK: Fetch users from backend (Firebase)
    
    public func fetchUsers() {
        // TODO: Implement the logic
    }
    
    // MARK: Add user on backend (Firebase)
    
    public func addUser(_ user: User) {
        // TODO: Implement the logic
    }
    
    // MARK: Update user on backend (Firebase)
    
    public func updateUser(_ user: User) {
        // TODO: Implement the logic
    }
    
    // MARK: Delete user on backend (Firebase)
    
    public func deleteUser(_ user: User) {
        // TODO: Implement the logic
    }
    
    // MARK: Private Methods
    
    private func convertToUsers(withData data: Data) throws -> [User] {
        var tempList = [User]()

        let jsonParsed = try JSON(data: data)
        
        if let resultsInJson = jsonParsed.dictionary {
            for (key, value) in resultsInJson {
                let userFromJSON = User(withName: value["user_id"].stringValue, description: value["text"].stringValue, objectId: key)
                
                tempList.append(userFromJSON)
            }
        }
        
        return tempList
    }
}
