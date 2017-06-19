//
//  Animal.swift
//  oop-abstract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

enum AnimalFoods {
    case meat
    case plants
    case eggs
}

protocol Animal {
    func getSound() -> String
}
