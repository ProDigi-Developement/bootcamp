//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation
import SystemConfiguration

public typealias ControllerSuccessScenario = () -> Void
public typealias ControllerFailScenario = (String) -> Void

public final class UserController {
    public private(set) var userList: [User]
    public var delegate: FetchDelegate? = nil
    
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
        let url: String = "https://google.com"

        guard let urlRequest = URL(string: url) else {
            print("Not possible to create the URL object")
            return
        }
        
//        var request = URLRequest(url: urlRequest)
//        request.httpMethod = ""
//        request.httpBody = Data()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let errorUnwrapped = error {
                print("🚨 ERROR: \(errorUnwrapped.localizedDescription)")
            } else {
                if let dataUnwrapped = data {
                    // TODO: Convert data to Custom Object
                    do {
                        self.userList = try self.convertToUsers(withData: dataUnwrapped)
                        
                        self.delegate?.fetchedAllUsers()
                    } catch {
                        print("🚨 Error from convert User.")
                    }
                } else {
                    print("Data is nil/NULL")
                }
            }
        })
        
        task.resume()
    }
    
    // MARK: Add user on backend (Firebase)
    
    public func addUser(_ user: User, onSuccess: @escaping ControllerSuccessScenario, onFail: @escaping ControllerFailScenario) {
        // TODO: Implement the logic
        let random = Int(arc4random_uniform(5))

        if random % 2 == 0 {
            onSuccess()
        } else {
            onFail("Generic error")
        }
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
