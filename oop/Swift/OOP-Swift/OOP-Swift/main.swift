//
//  main.swift
//  oop-abastract
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation

print("OOP Swift how NOT to do examples.\n")


// Dog example
let lessie = Animal(withType: .dog)
print("Dog Lessie Sound: \(lessie.getSound())\nFood: \(lessie.baseFood)")

// Lion example
let scar = Animal(withType: .lion)
print("Lion Scar Sound: \(scar.getSound())\nFood: \(scar.baseFood)")

// Sheep example
let dolly = Animal(withType: .sheep)
print("Sheep Dolly Sound: \(dolly.getSound())\nFood: \(dolly.baseFood)")

// Cat example
let garfield = Animal(withType: .cat)
print("Cat Garfield Sound: \(garfield.getSound())\nFood: \(garfield.baseFood)")

print("\n")
print("Using a single class and putting everything on it is a mess.\n")
