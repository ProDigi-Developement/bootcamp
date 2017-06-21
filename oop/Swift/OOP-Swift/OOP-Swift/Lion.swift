//
//  Lion.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class Lion: Animal {
    var baseFood: AnimalFoods
    var maxAge: Int
    
    init() {
        self.baseFood = .meat
        self.maxAge = 25
    }
   
    func getSound() -> String {
        return "Roar"
    }
}
