//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation

class UserController {
    private typealias FetchSuccessScenario = (Data) -> Void
    private typealias FetchFailScenario = (String) -> Void

    public private(set) var userList: [User]
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
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            self.delegate?.fetchFailed(errorMessage: "Failed to parse the URL.")
            return
        }
        
        self.fetch(url: url, onSuccess: onFetchUserSuccess, onFail: onFetchUserFail)
    }
    
    // MARK: Private Methods
    
    
    // MARK: Fetch Users callbacks
    private func onFetchUserSuccess(data: Data) {
        do {
            let userList = try self.convertToUsers(withData: data)
            self.userList = userList

            self.delegate?.fetchAll()
        } catch {
            self.delegate?.fetchFailed(errorMessage: "Not possible to convert the JSON to User objects")
        }
    }
    
    private func onFetchUserFail(error: String) {
        self.delegate?.fetchFailed(errorMessage: error)
    }
    
    // MARK: Generic method
    
    private func fetch(url: URL, onSuccess: @escaping FetchSuccessScenario, onFail: @escaping FetchFailScenario) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let errorUnwrapped = error {
                onFail(errorUnwrapped.localizedDescription)
            } else {
                guard let httpResponse = response as? HTTPURLResponse else {
                    onFail("Failed to parse HTTPURLResponse object")
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    onFail("Failed to receive status code 200. Received: \(httpResponse.statusCode)")
                    return
                }
                
                if let dataUnwrapped = data {
                    onSuccess(dataUnwrapped)
                } else {
                    onFail("No data from response.")
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
