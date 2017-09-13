//
//  Queue.swift
//  SwiftAlgorithm
//
//  Created by Thinh Le on 2017-07-18.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

public struct Queue<T>
{
    fileprivate var array: [T] = [] // = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
        
    }
    
    public var front: T? {
        return array.first
    }
}
