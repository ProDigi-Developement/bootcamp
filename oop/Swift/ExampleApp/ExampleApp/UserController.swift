//
//  UserController.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation

public typealias ControllerSuccessScenario = () -> Void
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
        guard let url = URL(string: "https://prodigi-bootcamp.firebaseio.com/oUhddrCgG9fRxdixzIEySnf4Gsg1/messages.json?auth=eyJhbGciOiJSUzI1NiIsImtpZCI6IjUwOTQ5NTk0NDUyOGNlMWE2YjhjZDljNzVlMTA1YjkxOGY1NjMwYmQifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvZGlnaS1ib290Y2FtcCIsImF1ZCI6InByb2RpZ2ktYm9vdGNhbXAiLCJhdXRoX3RpbWUiOjE0OTg1MDM5MjAsInVzZXJfaWQiOiJvVWhkZHJDZ0c5ZlJ4ZGl4eklFeVNuZjRHc2cxIiwic3ViIjoib1VoZGRyQ2dHOWZSeGRpeHpJRXlTbmY0R3NnMSIsImlhdCI6MTQ5ODUwMzkyMCwiZXhwIjoxNDk4NTA3NTIwLCJlbWFpbCI6Imtpb2JyZW5vK2ZpcmViYXNlQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJraW9icmVubytmaXJlYmFzZUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.b7zqlnjcwC8d2ev46q_4cISuTmwH9BTclmvSCtkpK5gGZhk-R4m72rj5CDP8md3EhMkacsb3tGFJjC1y-XGplrlhPK8uKr22z6sI-xIkbPUz7otJYXXsXfIOn1hEHqc8i43Xtd15ZgH0OAJ8hAKCGwGIMd7dCf7PBQq-Li580iXQl8wz3hoddFaP4K0Rkhn_wBvbATarVqt7tnYiTtb65GHlhD8_tV4mwocKZlhGj5zDSsmIpbL3UHMEvtAXUEqRiMC8YfI_FcI20tgBQ94VMRyc51HHooR0tJlwddP6dGdrX7_ZW8vjjIRe4kfz6OwwIUFCdwP9gdCO1glsrh2N_Q") else {
            self.delegate?.fetchUsersFailed(errorMessage: "Failed to parse the URL.")
            return
        }
        
        self.userList = [User]()
        
        var requestUrl = URLRequest(url: url)
        requestUrl.httpMethod = "GET"
        
        self.fetch(url: requestUrl, onSuccessScenario: onFetchUserSuccess, onFailScenario: onFetchUserFail)
    }
    
    public func addUser(_ user: User, onSuccess: @escaping ControllerSuccessScenario, onFail: @escaping ControllerFailScenario) {
        guard let url = URL(string: "https://prodigi-bootcamp.firebaseio.com/oUhddrCgG9fRxdixzIEySnf4Gsg1/messages.json?auth=eyJhbGciOiJSUzI1NiIsImtpZCI6IjUwOTQ5NTk0NDUyOGNlMWE2YjhjZDljNzVlMTA1YjkxOGY1NjMwYmQifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvZGlnaS1ib290Y2FtcCIsImF1ZCI6InByb2RpZ2ktYm9vdGNhbXAiLCJhdXRoX3RpbWUiOjE0OTg1MDM5MjAsInVzZXJfaWQiOiJvVWhkZHJDZ0c5ZlJ4ZGl4eklFeVNuZjRHc2cxIiwic3ViIjoib1VoZGRyQ2dHOWZSeGRpeHpJRXlTbmY0R3NnMSIsImlhdCI6MTQ5ODUwMzkyMCwiZXhwIjoxNDk4NTA3NTIwLCJlbWFpbCI6Imtpb2JyZW5vK2ZpcmViYXNlQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJraW9icmVubytmaXJlYmFzZUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.b7zqlnjcwC8d2ev46q_4cISuTmwH9BTclmvSCtkpK5gGZhk-R4m72rj5CDP8md3EhMkacsb3tGFJjC1y-XGplrlhPK8uKr22z6sI-xIkbPUz7otJYXXsXfIOn1hEHqc8i43Xtd15ZgH0OAJ8hAKCGwGIMd7dCf7PBQq-Li580iXQl8wz3hoddFaP4K0Rkhn_wBvbATarVqt7tnYiTtb65GHlhD8_tV4mwocKZlhGj5zDSsmIpbL3UHMEvtAXUEqRiMC8YfI_FcI20tgBQ94VMRyc51HHooR0tJlwddP6dGdrX7_ZW8vjjIRe4kfz6OwwIUFCdwP9gdCO1glsrh2N_Q") else {
            self.delegate?.fetchUsersFailed(errorMessage: "Failed to parse the URL.")
            return
        }
        
        let jsonData = try! JSON(user.toJSON()).rawData()

        var requestUrl = URLRequest(url: url)
        requestUrl.httpMethod = "POST"
        requestUrl.httpBody = jsonData
        
        requestUrl.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        self.fetch(url: requestUrl,
                   onSuccessScenario: { data in
                        self.fetchUsers()
                        
                        onSuccess()
        },
                   onFailScenario: { errorMessage in
                    onFail(errorMessage)
        })
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
                        self.fetchUsers()
                        
                        onSuccess()
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
                        self.fetchUsers()
                        
                        onSuccess()
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
        
        if let resultsInJson = jsonParsed.dictionary {
            for (key, value) in resultsInJson {
                let userFromJSON = User(withName: value["user_id"].stringValue, description: value["text"].stringValue)
                
                tempList.append(userFromJSON)
            }
        }
        
        return tempList
    }
}
