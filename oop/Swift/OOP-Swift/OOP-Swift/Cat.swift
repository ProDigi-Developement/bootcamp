//
//  Cat.swift
//  OOP-Swift
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Cat: Animal {
    internal var baseFood: AnimalFoods
    
    init() {
        self.baseFood = .milk
    }
    
    func getSound() -> String {
        return "Meow"
    }
}
