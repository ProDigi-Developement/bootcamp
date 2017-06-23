//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation

public typealias ControllerSuccessScenario = (User) -> Void
public typealias ControllerFailScenario = (String) -> Void

public final class UserController {
    private typealias FetchSuccessScenario = (Data) -> Void
    private typealias FetchFailScenario = (String) -> Void
    
    public private(set) var userList: [User]
    public var delegate: FetchDelegate? = nil
    
    // MARK: Singleton
    public static let shared: UserController = {
        let instance = UserController()
        return instance
    }()
    
    private init() {
        self.userList = [User]()
    }
    
    public func fetchUsers() {
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            self.delegate?.fetchUsersFailed(errorMessage: "Failed to parse the URL.")
            return
        }
        
        var requestUrl = URLRequest(url: url)
        requestUrl.httpMethod = "GET"
        
        self.fetch(url: requestUrl, onSuccessScenario: onFetchUserSuccess, onFailScenario: onFetchUserFail)
    }
    
    public func updateUser(_ user: User, onSuccess: @escaping ControllerSuccessScenario, onFail: @escaping ControllerFailScenario) {
        // TODO: implement the logic to update user object
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            onFail("Failed to parse the URL.")
            return
        }
        
        var requestUrl = URLRequest(url: url)
        requestUrl.httpMethod = "PUT"
        
        self.fetch(url: requestUrl,
                   onSuccessScenario: { data in
                    do {
                        let userList = try self.convertToUsers(withData: data)
                        
                        onSuccess(userList.first!)
                    } catch {
                        onFail("Not possible to convert the JSON to User objects")
                    }
        },
                   onFailScenario: { errorMessage in
                    onFail(errorMessage)
        })
    }
    
    public func deleteUser(_ user: User, onSuccess: @escaping ControllerSuccessScenario, onFail: @escaping ControllerFailScenario) {
        // TODO: implement the logic to delete user object
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else {
            self.delegate?.fetchUsersFailed(errorMessage: "Failed to parse the URL.")
            return
        }
        
        var requestUrl = URLRequest(url: url)
        requestUrl.httpMethod = "DELETE"
        
        self.fetch(url: requestUrl,
                   onSuccessScenario: { data in
                    do {
                        let userList = try self.convertToUsers(withData: data)
                        
                        onSuccess(userList.first!)
                    } catch {
                        onFail("Not possible to convert the JSON to User objects")
                    }
        },
                   onFailScenario: { errorMessage in
                    onFail(errorMessage)
        })
    }
    
    // MARK: Private Methods
    
    // MARK: Fetch Users callbacks
    private func onFetchUserSuccess(data: Data) {
        do {
            let userList = try self.convertToUsers(withData: data)
            self.userList = userList

            self.delegate?.fetchedAllUsers()
        } catch {
            self.delegate?.fetchUsersFailed(errorMessage: "Not possible to convert the JSON to User objects")
        }
    }
    
    private func onFetchUserFail(error: String) {
        self.delegate?.fetchUsersFailed(errorMessage: error)
    }
    
    // MARK: Generic methods
    
    private func fetch(url: URLRequest, onSuccessScenario onSuccess: @escaping FetchSuccessScenario, onFailScenario onFail: @escaping FetchFailScenario) {
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
