//
//  Operation.swift
//  HeartBeat-Swift
//
//  Created by Thinh Le on 2017-05-25.
//  Copyright © 2017 Lac Viet Inc. All rights reserved.
//

import Foundation
import Darwin

class MathOperation: NSObject {
    
    static func sum(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    static func dif(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    static func mul(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
    
    static func div(_ a: Double, _ b: Double) -> Double {
        return a / b
    }
    
    static func isOdd(_ num: Int) -> Bool {
        if num % 2 == 1 {
            return true
        } else {
            return false
        }
    }
    
    static func isEven(_ num: Int) -> Bool {
        if num % 2 == 0 {
            return true
        } else {
            return false
        }
    }
    
    static func factorial(_ num: Int) -> Int {
        if (num == 0) {
            return -1;
        } else if (num == 1) {
            return 1;
        } else {
            return factorial(num - 1) * num;
        }
    }
    
    static func fiboSeries(_ numTerms: Int) -> [Int] {
    
        let fiboArray: NSMutableArray = [0, 1]

        if (numTerms == 2) {
            return [0, 1]
        }
        
        else if (numTerms > 2) {
            for i in 2..<numTerms {
                let first: Int = fiboArray[i-2] as! Int
                let second: Int = fiboArray[i-1] as! Int
                let third = first + second
                fiboArray[i] = third
            }
            return fiboArray as! [Int]
        }
        
        return fiboArray as! [Int]
    
    }
    
    static func findPrime(_ lowerBound: Int, _ upperBound: Int) -> [Int] {
        var resultArray: [Int] = []
        
        for i in lowerBound..<upperBound {
            if isPrime(i) {
                resultArray.append(i)
            }
        }
        
        return resultArray

    }
    
    static func isPrime(_ num: Int) -> Bool {
        //solution 1
//        if num == 1 { return false }
//        
//        var i = 2
//        while i < num {
//            if (num % i == 0) { return false }
//            i += 1
//        }
//        return true
        
        // solution 2
        return num > 1 && !(2..<num).contains { num % $0 == 0 }

    }
    
    static func dctTransform(_ matrix: [[Double]]) {
        //var i, j, k, l: Int
        let m = 8
        let n = 8
    
        // dct will store the discrete cosine transform
        var dct: [[Double]]? = Array(repeating: Array(repeating: 0, count: m), count: n)

        var ci, cj, dct1, sum: Double
    
        for i in 0..<m {
            for j in 0..<n {
                // ci and cj depends on frequency as well as
                // number of row and columns of specified matrix
                let di = Double(i)
                let dj = Double(j)
                let dm = Double(m)
                let dn = Double(n)
                if (i == 0) {
                    ci = 1.0 / sqrt(dm)
                } else {
                    ci = sqrt(2.0) / sqrt(dm)
                }
                
                if (j == 0) {
                    cj = 1.0 / sqrt(dn)
                } else {
                    cj = sqrt(2.0) / sqrt(dn)
                }
                
                // sum will temporarily store the sum of
                // cosine signals
                sum = 0.0;
                for k in 0..<m {
                    for l in 0..<n {
                        let dk = Double(k)
                        let dl = Double(l)
                        let dcos1 = cos((2.0 * dk + 1.0) * di * Double.pi / (2.0 * dm))
                        let dcos2 = cos((2.0 * dl + 1.0) * dj * Double.pi / (2.0 * dn))
                        dct1 = matrix[k][l] * dcos1 * dcos2
                        sum = sum + dct1
                    }
                }
                
                dct?[i][j] = ci * cj * sum
            }
        }
    
        //print(String(format:"%.9f\n", Double.pi))
        for i in 0..<m {
            for j in 0..<n {
                print(String(format:"%.3f ", (dct![i][j])))
            }
            print("\n")
        }
        
    }
    
}
