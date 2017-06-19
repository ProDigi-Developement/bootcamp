//
//  Lion.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public class Lion: Animal {
    internal var baseFood: AnimalFoods
    
    init() {
        self.baseFood = .meat
    }
   
    func getSound() -> String {
        return "Roar"
    }
}
