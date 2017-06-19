//
//  Lion.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class Lion: Animal {
    var baseFood: AnimalFoods {
        return .meat
    }

    var maxAge: Int {
        return 25
    }
    
    init() {
        // Nothing to see here. Keep moving 🚶🏻
    }
   
    func getSound() -> String {
        return "Roar"
    }
    
    func toString() -> String {
        return "Lion Sound: \(self.getSound())\nFood: \(self.baseFood)\nMax Age: \(self.maxAge)\n"
    }
}
