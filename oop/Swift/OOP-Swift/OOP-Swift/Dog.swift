//
//  Dog.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class Dog: Animal {
    private var owner: String
    
    public var baseFood: AnimalFoods {
        return .milk
    }
    
    public var maxAge: Int {
        return 12
    }
    
    public init(withOwner name: String) {
        self.owner = name
    }

    public func getSound() -> String {
        return "Woof"
    }
    
    public func toString() -> String {
        return "Dog Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\nOwner: \(self.owner)\n"
    }
}
