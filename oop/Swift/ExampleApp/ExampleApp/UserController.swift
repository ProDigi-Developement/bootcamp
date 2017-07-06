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
    public typealias InternalControllerSuccessScenario = (Data) -> Void
    public typealias InternalControllerFailScenario = (String) -> Void

    public private(set) var userList: [User]
    public var delegate: FetchDelegate? = nil
    
    private var token: String = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJiYjY5NTczZjAzMDUyOTdkNDc0MDQ1OWE0YzA2N2Q1NGI1YmRmMjkifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvZGlnaS1ib290Y2FtcCIsImF1ZCI6InByb2RpZ2ktYm9vdGNhbXAiLCJhdXRoX3RpbWUiOjE0OTkyOTk1NTUsInVzZXJfaWQiOiJCRU4yWmx6WGJwYlFadmlPdVhLdlFkeWJDMXYxIiwic3ViIjoiQkVOMlpselhicGJRWnZpT3VYS3ZRZHliQzF2MSIsImlhdCI6MTQ5OTI5OTU1NSwiZXhwIjoxNDk5MzAzMTU1LCJlbWFpbCI6Imtpb2JyZW5vK3Byb2RpZ2lAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbImtpb2JyZW5vK3Byb2RpZ2lAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.rTPmvODQg_jFVFMtFmGGZI2FMLgiPviG3XwpAP9g1WDDChqma_iQ6i_Oho5okLNrNM19RRs3lMnn9WFbRa5vWBLlsw65TqIB8NtkzBXP1KR1m0iWY3PgXCtBUgk6KgbuI9QqfPFRBcpnPEk34irwD8MwsC9gfbt6rgyQh0ebiMAldeTCObZur2lxha6KwEqAe51OYzFwMz2ioBaEzWQfnNKAw0ZxmI5IP3kqdWfhysGR_nvM0qedSlxw_YytQIdas44b9wwtj-EGYFeY_U-lekXdbLeCyF6VmOfWbFzosMiwibuB9Do3Qdm44mCQXSVkOFKffG7e4IvxczpReH2N-Q"
    
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
        let url: String = "https://prodigi-bootcamp.firebaseio.com/BEN2ZlzXbpbQZviOuXKvQdybC1v1/messages.json?auth=\(self.token)"

        guard let urlRequest = URL(string: url) else {
            print("Not possible to create the URL object")
            return
        }
        
        self.fetch(request: URLRequest(url: urlRequest), onSuccess: onFetchUsersSuccess, onFail: onFetchUsersFail)
        
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
        
//        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
//            if let errorUnwrapped = error {
//                print("🚨 ERROR: \(errorUnwrapped.localizedDescription)")
//            } else {
//                if let dataUnwrapped = data {
//                    // TODO: Convert data to Custom Object
//                    do {
//                        self.userList = try self.convertToUsers(withData: dataUnwrapped)
//                        
//                        self.delegate?.fetchedAllUsers()
//                    } catch {
//                        print("🚨 Error from convert User.")
//                    }
//                } else {
//                    print("Data is nil/NULL")
//                }
//            }
//        })
//        
//        task.resume()
    }
    
    private func onFetchUsersSuccess(data: Data) {
        // TODO: convert data to users and then fill userList
        
        do {
            self.userList = try self.convertToUsers(withData: data)

            self.delegate?.fetchedAllUsers()
        } catch {
            print("🚨 Error from convert User.")
//            onFetchUsersFail(error: error.localizedDescription)
        }
    }
    
    private func onFetchUsersFail(error: String) {
        self.delegate?.fetchUsersFailed(errorMessage: error)
    }
    
    // MARK: Add user on backend (Firebase)
    
    public func addUser(_ user: User, onSuccess: @escaping ControllerSuccessScenario, onFail: @escaping ControllerFailScenario) {
        
        let url: String = "https://prodigi-bootcamp.firebaseio.com/BEN2ZlzXbpbQZviOuXKvQdybC1v1/messages.json?auth=\(self.token)"
        
        guard let urlRequest = URL(string: url) else {
            print("Not possible to create the URL object")
            return
        }
        
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "POST"
        
        let jsonObject = JSON(user.toJSON())
        let jsonData = try! jsonObject.rawData()
        
//        let jsonData2 = try! JSONSerialization.jsonObject(with: user.toJSON(), options: []) as? [String: Any]
    
        request.httpBody = jsonData
        
        self.fetch(request: request,
                   onSuccess: { data in
                    onSuccess()
        },
                   onFail: onFail)
    }
    
    // MARK: Update user on backend (Firebase)
    
    public func updateUser(_ user: User) {
        // TODO: Implement the logic
    }
    
    // MARK: Delete user on backend (Firebase)
    
    public func deleteUser(_ user: User, onSuccess: @escaping ControllerSuccessScenario, onFail: @escaping ControllerFailScenario) {
        let stringFormat: String = "https://prodigi-bootcamp.firebaseio.com/BEN2ZlzXbpbQZviOuXKvQdybC1v1/messages/%@.json?auth=\(self.token)"
        
        let url: String = String(format: stringFormat, user.objectId)
        
        guard let urlRequest = URL(string: url) else {
            print("Not possible to create the URL object")
            return
        }
        
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "DELETE"
        
        self.fetch(request: request,
                   onSuccess: { data in
                        onSuccess()
        }, onFail: onFail)
    }
    
    private func fetch(request: URLRequest, onSuccess: @escaping InternalControllerSuccessScenario, onFail: @escaping InternalControllerFailScenario) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
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
                
//                self.fetchUsers()
                if let dataUnwrapped = data {
                    onSuccess(dataUnwrapped)
                } else {
                    onFail("Data is nil")
                }
            }
        })
        
        task.resume()
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
