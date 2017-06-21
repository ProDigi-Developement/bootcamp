//
//  Animal.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

class Animal {
    enum AnimalType {
        case dog
        case cat
        case lion
        case sheep
    }
    
    var type: AnimalType
    
    init(withType type: AnimalType) {
        self.type = type
    }

    func getSound() -> String {
        var sound: String = ""
        switch self.type {
        case .dog:
            sound = "Woof"
            break
        case .cat:
            sound = "Meow"
            break
        case .lion:
            sound = "Roar"
            break
        case .sheep:
            sound = "Baaa"
            break
        }
        
        return sound
    }
}
