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

final class PersonController {
    public private(set) var list: [Person]
    public static let sharedInstance = PersonController()
    public var selectedUser: Person? = nil
    private let url: String = "https://randomuser.me/api/?results=25"
    
    private init() {
        self.list = [Person]()
    }
    
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
    
    private func convertToUsers(withData data: Data) throws -> [Person] {
        var tempList = [Person]()
        
        let jsonParsed = try JSON(data: data)
        
        if let resultsOnJson = jsonParsed["results"].array {
            for elementFromJSON in resultsOnJson {
                let firstName = elementFromJSON["name"]["first"].stringValue
                let lastName = elementFromJSON["name"]["last"].stringValue
                let email = elementFromJSON["email"].stringValue

                let userFromJSON = Person(with: firstName, lastName: lastName, email: email)
                
                tempList.append(userFromJSON)
            }
        }
        
        return tempList
    }
}
