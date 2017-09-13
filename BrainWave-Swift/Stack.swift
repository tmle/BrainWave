//
//  DataStructure.swift
//  SwiftAlgorithm
//
//  Created by Thinh Le on 2017-07-18.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
         return array.popLast()
        }
    }
    
    public var top: T? {
        return array.last
    }
    
//    extension Stack: Sequence {
//        public func makeIterator() -> AnyIterator<T> {
//            var curr = self
//            return AnyIterator {_ -> T? in
//                return curr.pop()
//            }
//        }
//    }
//    
//    extension Stack: SequenceType {
//        func generate() -> StackGenerator<Element> {
//            return StackGenerator<Element>(stack: self)
//        }
//    }
    
}
