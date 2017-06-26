//
//  User.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class User {
    public let name: String
    public let description: String
    
    public init(withName name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    public func toString() -> String {
        return "User name: \(self.name)\n Description: \(self.description)"
    }
    
    func toJSON() -> Dictionary<String, String> {
        return [
            "user_id": self.name,
            "text": self.description
        ]
    }
}
