//
//  User.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class User {
    public let name: String
    
    public init(withName name: String) {
        self.name = name
    }
    
    public func toString() -> String {
        return "User name: \(self.name)"
    }
}
