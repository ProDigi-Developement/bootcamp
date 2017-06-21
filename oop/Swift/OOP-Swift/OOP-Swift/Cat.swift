//
//  Cat.swift
//  OOP-Swift
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Cat: Animal {
    var baseFood: AnimalFoods
    var maxAge: Int
    
    init() {
        self.baseFood = .milk
        self.maxAge = 10
    }
    
    func getSound() -> String {
        return "Meow"
    }
    
    func toString() -> String {
        return "Cat Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\n"
    }
}
