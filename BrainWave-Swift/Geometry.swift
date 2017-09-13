//
//  Geometry.swift
//  BrainWave-Swift
//
//  Created by Thinh Le on 2017-07-19.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

class Shape {
    
    func area() -> Float {
        return 0
    }
    
    func perimeter() -> Float {
        return 0
    }
}

class Circle : Shape {
    var radius:Float! = 1.0
    
    init(radius: Float) {
        self.radius = radius
    }
    
    override func area() -> Float {
        return Float(Double.pi) * powf(radius, 2.0)
    }
    
    override func perimeter() -> Float {
        return 2 * Float(Double.pi) * radius
    }
}

class Square : Shape {
    var side:Float = 1.0
    
    init(side: Float) {
        self.side = side
    }
    
    override func area() -> Float {
        return side * side
    }
    
    override func perimeter() -> Float {
        return 4 * side
    }
}

class Rectangle : Shape {
    var length:Float = 1.0
    var width:Float = 1.0
    
    init(length: Float, width: Float) {
        self.length = length
        self.width = width
    }
    
    override func area() -> Float {
        return length * width
    }
    
    override func perimeter() -> Float {
        return 2 * (length + width)
    }
}
