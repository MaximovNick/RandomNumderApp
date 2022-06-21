//
//  RandomNumber.swift
//  RandomNumderApp
//
//  Created by Nikolai Maksimov on 21.06.2022.
//

import Foundation


struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
