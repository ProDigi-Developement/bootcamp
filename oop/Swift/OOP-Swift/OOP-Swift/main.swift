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
print(lessie.toString())

// Lion example
let scar = Animal(withType: .lion)
print(scar.toString())

// Sheep example
let dolly = Animal(withType: .sheep)
print(dolly.toString())

// Cat example
let garfield = Animal(withType: .cat)
print(garfield.toString())

print("Using a single class and putting everything on it is a mess.\n")
