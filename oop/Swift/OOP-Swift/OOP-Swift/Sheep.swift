//
//  Rhyno.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class Sheep: Animal {
    public var baseFood: AnimalFoods {
        return .plants
    }

    public var maxAge: Int {
        return 15
    }
    
    public init() {
        // Nothing to see here. Keep moving 🚶🏻
    }

    public func getSound() -> String {
        return "Baaa"
    }
    
    public func toString() -> String {
        return "Sheep Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\n"
    }
}
