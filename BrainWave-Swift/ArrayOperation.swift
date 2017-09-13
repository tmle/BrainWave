//
//  ArrayOperation.swift
//  BrainWave-Swift
//
//  Created by Thinh Le on 2017-07-24.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

class ArrayOperation: NSObject {
    
    static func findRect(_ array: [[Int]]) -> (x1: Int, y1: Int, x2: Int, y2: Int) {

        let max_row = array.count
        let max_col = array[0].count
        var zeroFound = false
        var oneColFound = false
        var oneRowFound = false
        var a1 = 0
        var b1 = 0
        var a2 = 0
        var b2 = 0
        
        for row in 0..<max_row {
            for col in 0..<max_col {
                if (!zeroFound && array[row][col]==0) {
                    zeroFound = true
                    a1 = col
                    b1 = row
                    print("a1, b1 = \(a1), \(b1)")

                }
            }
        }
        
        for row in b1..<max_row {
            for col in a1..<max_col {
                if (!oneColFound && array[row][col]==1) {
                    oneColFound = true
                    a2 = col-1
                    print("a2 = \(a2)")
                }
            }
            
            if (!oneRowFound && array[row][a1]==1) {
                oneRowFound = true
                b2 = row-1
                print("b2 = \(b2)")
            }
            
        }
        //print("\(x1), \(y1), \(x2), \(y2)")
        
        return (a1, b1, a2, b2)

    }

}

