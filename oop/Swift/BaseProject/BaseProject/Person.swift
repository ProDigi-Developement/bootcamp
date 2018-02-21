//
//  CustomObject.swift
//  BaseProject
//
//  Created by Caio Dias on 2017-06-22.
//  Copyright © 2017 ProDigi. All rights reserved.
//

public class Person {
    public private(set) var firstName: String
    public private(set) var lastName: String
    public private(set) var email: String
    
    public var fullName: String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    init(with firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
