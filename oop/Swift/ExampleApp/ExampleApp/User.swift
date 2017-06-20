//
//  User.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class User {
    public let name: String
    
    init(withName name: String) {
        self.name = name
    }
    
    func toString() -> String {
        return "User name: \(self.name)"
    }
}
