//
//  main.swift
//  oop-abastract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation

print("OOP Swift examples.")
print("⚠️ Swift does not have abstract option yet. However, is possible to mimic it using protocols.\n")


// Dog example
let lessie = Dog()
print("Dog Lessie Sound: \(lessie.getSound())\nFood: \(lessie.baseFood)")

// Lion example
let scar = Lion()
print("Lion Scar Sound: \(scar.getSound())\nFood: \(scar.baseFood)")

// Sheep example
let dolly = Sheep()
print("Sheep Dolly Sound: \(dolly.getSound())\nFood: \(dolly.baseFood)")

// Cat example
let garfield = Sheep()
print("Cat Garfield Sound: \(garfield.getSound())\nFood: \(garfield.baseFood)")

print("\n")
print("Using protocols, inheritance and objects we are able to plot different scenarios with a very few lines of code.\n")
