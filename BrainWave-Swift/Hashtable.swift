//
//  Hashtable.swift
//  BrainWave-Swift
//
//  Created by Thinh Le on 2017-08-01.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    private(set) public var count = 0
    
    public var isEmpty: Bool { return count == 0 }
    
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    private func index(forKey key: Key) -> Int {
        //print(" \(abs(key.hashValue) % buckets.count), \(key.hashValue), \(buckets.count)")
        return abs(key.hashValue) % buckets.count
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                //print("\(String(describing: updateValue(value, forKey: key)))")
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    public func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil  // key not in hash table
    }
    
    public func search(forKey key: Key) -> (found: Bool, index: Int)? {
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                return (true, i)
            }
        }
        
        return (false, -1)
    }
    
    public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Do we already have this key in the bucket?
        for (i, element) in buckets[index].enumerated() {
            //print("\(element.key), \(element.value)")
            if element.key == key {
                let oldValue = element.value
                print("Duplicate found: \(key), \(value)")
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        // This key isn't in the bucket yet; add it to the chain.
        //print("2. \(key), \(value)")
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    public mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Find the element in the bucket's chain and remove it.
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil  // key not in hash table
    }

}
