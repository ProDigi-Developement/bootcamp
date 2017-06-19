//
//  Rhyno.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Sheep: Animal {
    var baseFood: AnimalFoods
    
    init() {
        self.baseFood = .plants
    }

    func getSound() -> String {
        return "Baaa"
    }
}
