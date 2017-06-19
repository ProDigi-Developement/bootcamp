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
let lessie = Animal(withType: .dog)
print("Dog Lessie Sound: \(lessie.getSound())")

// Lion example
let scar = Animal(withType: .lion)
print("Lion Scar Sound: \(scar.getSound())")

// Sheep example
let dolly = Animal(withType: .sheep)
print("Sheep Dolly Sound: \(dolly.getSound())")

print("\n")
print("Using protocols, inheritance and objects we are able to plot different scenarios with a very few lines of code.\n")
