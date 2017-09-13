//
//  Algebra.swift
//  BrainWave-Swift
//
//  Created by Thinh Le on 2017-07-19.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

func timeTables(_ num: Int) -> (one: Int, two: Int, three: Int, four: Int, five: Int, six: Int, seven: Int, eight: Int, nine: Int, ten: Int, eleven: Int, twelve: Int) {
    
    let one: Int = num * 1
    let two: Int = num * 2
    let three: Int = num * 3
    let four: Int = num * 4
    let five: Int = num * 5
    let six: Int = num * 6
    let seven: Int = num * 7
    let eight: Int = num * 8
    let nine: Int = num * 9
    let ten: Int = num * 10
    let eleven: Int = num * 11
    let twelve: Int = num * 12
    
    return (one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve)
}
