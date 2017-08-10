//
//  User.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class User {
    public let objectId: String
    public var name: String
    public var description: String
    
    public init(withName name: String, description: String, objectId: String) {
        self.objectId = objectId
        self.name = name
        self.description = description
    }
    
    public func toString() -> String {
        return "User name: \(self.name)\n Description: \(self.description)"
    }
    
    func toJSON() -> Dictionary<String, String> {
        return [
            "user_name": self.name,
            "description": self.description
        ]
    }
}
