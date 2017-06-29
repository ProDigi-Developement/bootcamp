//
//  CustomController.swift
//  BaseProject
//
//  Created by Caio Dias on 2017-06-22.
//  Copyright © 2017 ProDigi. All rights reserved.
//

import SystemConfiguration
import Foundation

typealias SuccessScenario = () -> Void
typealias FailScenario = (String) -> Void

final class CustomController {
    public private(set) var list: [CustomObject]
    public static let sharedInstance = CustomController()
    public var selectedUser: CustomObject? = nil
    private let url: String = "https://randomuser.me/api/?results=25"
    
    private init() {
        self.list = [CustomObject]()
    }
    
//    public func fetchListInfo(onSuccess: @escaping SuccessScenario, onFail: @escaping FailScenario) {
//        // Stub code to fill the list
//        let objectOne = CustomObject(withName: "One")
//        let objectTwo = CustomObject(withName: "Two")
//        let objectThree = CustomObject(withName: "Three")
//        let objectFour = CustomObject(withName: "Four")
//        let objectFive = CustomObject(withName: "Five")
//        
//        // Add the Stub custom objects to our list
//        self.list.append(objectOne)
//        self.list.append(objectTwo)
//        self.list.append(objectThree)
//        self.list.append(objectFour)
//        self.list.append(objectFive)
//        
//        if self.list.count > 0 {
//            onSuccess()
//        } else {
//            onFail("Error on fetch user list.")
//        }
//    }
    
    func fetchListInfo(onSuccess: @escaping SuccessScenario, onFail: @escaping FailScenario) {
        guard let urlRequest = URL(string: url) else {
            onFail("Not possible to create the URL object")
            return
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let error = error {
                onFail(error.localizedDescription)
            } else {
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                    else {
                    onFail("Error on fetch.")
                    return
                }
                
                if let data = data {
                    self.list = try! self.convertToUsers(withData: data)
                    onSuccess()
                } else {
                    onFail("Data is null")
                }
            }
        })
        
        task.resume()
    }
    
    private func convertToUsers(withData data: Data) throws -> [CustomObject] {
        var tempList = [CustomObject]()
        
        let jsonParsed = try JSON(data: data)
        
        if let resultsOnJson = jsonParsed["results"].array {
            for elementFromJSON in resultsOnJson {
                let firstName = elementFromJSON["name"]["first"].stringValue
                let userFromJSON = CustomObject(withName: firstName)
                
                tempList.append(userFromJSON)
            }
        }
        
        return tempList
    }
}
