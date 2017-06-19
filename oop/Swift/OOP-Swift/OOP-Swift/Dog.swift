//
//  Dog.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Dog: Animal {
    var owner: String
    
    var baseFood: AnimalFoods {
        return .milk
    }
    
    var maxAge: Int {
        return 12
    }
    
    init(withOwner name: String) {
        self.owner = name
    }

    func getSound() -> String {
        return "Woof"
    }
    
    func toString() -> String {
        return "Dog Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\nOwner: \(self.owner)\n"
    }
}
