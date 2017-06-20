//
//  Lion.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class Lion: Animal {
    public var baseFood: AnimalFoods {
        return .meat
    }

    public var maxAge: Int {
        return 25
    }
    
    public init() {
        // Nothing to see here. Keep moving 🚶🏻
    }
   
    public func getSound() -> String {
        return "Roar"
    }
    
    public func toString() -> String {
        return "Lion Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\n"
    }
}
