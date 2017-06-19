//
//  Rhyno.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Sheep: Animal {
    var baseFood: AnimalFoods {
        return .plants
    }

    var maxAge: Int {
        return 15
    }
    
    init() {
        // Nothing to see here. Keep moving 🚶🏻
    }

    func getSound() -> String {
        return "Baaa"
    }
    
    func toString() -> String {
        return "Sheep Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\n"
    }
}
