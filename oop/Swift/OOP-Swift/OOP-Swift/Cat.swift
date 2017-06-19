//
//  Cat.swift
//  OOP-Swift
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class Cat: Animal {
    private var owner: String

    public var baseFood: AnimalFoods {
        return .milk
    }

    public var maxAge: Int {
        return 10
    }
    
    public init(withOwner name: String) {
        self.owner = name
    }
    
    public func getSound() -> String {
        return "Meow"
    }
    
    public func toString() -> String {
        return "Cat Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\nOwner: \(self.owner)\n"
    }
}
