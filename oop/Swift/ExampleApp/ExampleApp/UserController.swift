//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation

class UserController {
    private var userList: [User]
    public var delegate: FetchDelegate? = nil
    
    // MARK: Singleton
    static let shared: UserController = {
        let instance = UserController()
        return instance
    }()
    
    private init() {
        self.userList = [User]()
    }
    
    public func fetchUsers() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            // fail
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let errorUnwrapped = error {
                self.delegate?.fetchFailed(errorMessage: errorUnwrapped.localizedDescription)
            } else {
                guard let httpResponse = response as? HTTPURLResponse else {
                    self.delegate?.fetchFailed(errorMessage: "Failed to parse HTTPURLResponse object")
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    self.delegate?.fetchFailed(errorMessage: "Failed to receive status code 200. Received: \(httpResponse.statusCode)")
                    return
                }
                
                if let data = data {
                    do {
                        let userList = try self.convertToUsers(withData: data)
                        self.userList = userList
                        
                        self.delegate?.fetchAll(usersList: self.userList)
                    } catch {
                        self.delegate?.fetchFailed(errorMessage: "Not possible to convert the JSON to User objects")
                    }
                } else {
                    self.delegate?.fetchFailed(errorMessage: "No data from response.")
                }
            }
        })
        
        task.resume()
    }
    
    private func convertToUsers(withData data: Data) throws -> [User] {
        var tempList = [User]()

        let jsonParsed = try JSON(data: data)
        
        if let resultsOnJson = jsonParsed["results"].array {
            for elementFromJSON in resultsOnJson {
                let userFromJSON = User(withName: elementFromJSON["name"]["first"].stringValue)
                
                tempList.append(userFromJSON)
            }
        }
        
        return tempList
    }
}
