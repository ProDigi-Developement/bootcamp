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
        let url: String = "https://prodigi-bootcamp.firebaseio.com/oUhddrCgG9fRxdixzIEySnf4Gsg1/messages.json?auth=eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyZTJkNTNmY2JlYjM1MmFmNGY5MDI5MjI5MWU2MTg4YWYwYTFmMGUifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvZGlnaS1ib290Y2FtcCIsImF1ZCI6InByb2RpZ2ktYm9vdGNhbXAiLCJhdXRoX3RpbWUiOjE0OTg3Nzc3NDksInVzZXJfaWQiOiJvVWhkZHJDZ0c5ZlJ4ZGl4eklFeVNuZjRHc2cxIiwic3ViIjoib1VoZGRyQ2dHOWZSeGRpeHpJRXlTbmY0R3NnMSIsImlhdCI6MTQ5ODc3Nzc0OSwiZXhwIjoxNDk4NzgxMzQ5LCJlbWFpbCI6Imtpb2JyZW5vK2ZpcmViYXNlQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJraW9icmVubytmaXJlYmFzZUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.aUcxfFeMWLCSltSIY19XKiKBQABhDJ_fKWnuMXn85_5MoE-vZRmKrYZlC8onVu70HwRtoBDPpw_yxex7rCicXuBiuUcWFWnwsCyz2TlrIq59-b2U22uvvaSltrHLy7uyoaTNHiSkK7RJ8W6eYInQ9WodyH-9wnaBPSo6O9eBcagnHY1RaYdKjKxutB_yReeOCOOUEouwRIkq5NrIEWUpKSJ7yXlwfYA_XMJB_EBvZ6Y0o2--9jeXh_Wgl0bXRDTOTgg2a1fZrCWGuPai24ZcLR71MX0nxvHElbMnrq7VLbPwEq8fMTjSJuYu9koKxl1zARr_M3eDHWrRaKutpI5Cwg"

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
                } else {
                    print("Data is nil/NULL")
                }
            }
        })
        
        task.resume()
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
