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
    private var token: String = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJiYjY5NTczZjAzMDUyOTdkNDc0MDQ1OWE0YzA2N2Q1NGI1YmRmMjkifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvZGlnaS1ib290Y2FtcCIsImF1ZCI6InByb2RpZ2ktYm9vdGNhbXAiLCJhdXRoX3RpbWUiOjE0OTkyOTU1ODksInVzZXJfaWQiOiJCRU4yWmx6WGJwYlFadmlPdVhLdlFkeWJDMXYxIiwic3ViIjoiQkVOMlpselhicGJRWnZpT3VYS3ZRZHliQzF2MSIsImlhdCI6MTQ5OTI5NTU5MCwiZXhwIjoxNDk5Mjk5MTkwLCJlbWFpbCI6Imtpb2JyZW5vK3Byb2RpZ2lAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbImtpb2JyZW5vK3Byb2RpZ2lAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.XipTw72pkB8vQy9KrbDp5nbkl1bqZpp-zUaPANJr6R2AxlL-q6-zYqAcPtwNk1LwnWLeorgnd4M4QMMowNNS50Qi2ia4KPechdbsUuIIjdNbergKqD-qfPR2oWU7L5HWk-sqM2t5Mzql-rC2LITP6fVD5K91GLVSPcuvjk5fO3-WzSTW8Sg-pk642QTiBO8HX66atq7BG8HE3boHFUJkBGI7COSMIpTum7B3U5z8J0QIGF3b9YuBDLFmEPu156QEJoh3Xm24KYo9Izr1EqCSt6zEpXOHhBbePALqHSrSfClcQpe2hJpI3orS1XVVrjT-ZITvUr8zh2w1MhOkZhgeeQ"
    
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
                
                
                self.fetchUsers()
                
                onSuccess()
            }
        })
        
        task.resume()
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
                
                self.fetchUsers()
                
                onSuccess()
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
