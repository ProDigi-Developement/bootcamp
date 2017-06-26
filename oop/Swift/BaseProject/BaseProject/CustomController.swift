//
//  CustomController.swift
//  BaseProject
//
//  Created by Caio Dias on 2017-06-22.
//  Copyright © 2017 ProDigi. All rights reserved.
//

typealias SuccessScenario = () -> Void
typealias FailScenario = (String) -> Void

final class CustomController {
    public private(set) var list: [CustomObject]
    public static let sharedInstance = CustomController()
    public var selectedUser: CustomObject? = nil
    
    private init() {
        self.list = [CustomObject]()
    }
    
    public func fetchListInfo(onSuccess: @escaping SuccessScenario, onFail: @escaping FailScenario) {
        // Stub code to fill the list
        let objectOne = CustomObject(withName: "One")
        let objectTwo = CustomObject(withName: "Two")
        let objectThree = CustomObject(withName: "Three")
        let objectFour = CustomObject(withName: "Four")
        let objectFive = CustomObject(withName: "Five")
        
        // Add the Stub custom objects to our list
        self.list.append(objectOne)
        self.list.append(objectTwo)
        self.list.append(objectThree)
        self.list.append(objectFour)
        self.list.append(objectFive)
        
        if self.list.count > 0 {
            onSuccess()
        } else {
            onFail("Error on fetch user list.")
        }
    }
}
