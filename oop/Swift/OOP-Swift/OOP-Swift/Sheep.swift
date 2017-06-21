//
//  Rhyno.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Sheep: Animal {
    var baseFood: AnimalFoods
    var maxAge: Int
    
    init() {
        self.baseFood = .plants
        self.maxAge = 15
    }

    func getSound() -> String {
        return "Baaa"
    }
    
    func toString() -> String {
        return "Sheep Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\n"
    }
}
