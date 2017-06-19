//
//  Cat.swift
//  OOP-Swift
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Cat: Animal {
    var owner: String

    var baseFood: AnimalFoods {
        return .milk
    }

    var maxAge: Int {
        return 10
    }
    
    init(withOwner name: String) {
        self.owner = name
    }
    
    func getSound() -> String {
        return "Meow"
    }
    
    func toString() -> String {
        return "Cat Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\nOwner: \(self.owner)\n"
    }
}
