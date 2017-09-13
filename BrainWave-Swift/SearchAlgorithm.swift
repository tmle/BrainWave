//
//  SearchAlgorithm.swift
//  SwiftAlgorithm
//
//  Created by Thinh Le on 2017-07-18.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

enum nodeState: Int {
    case initial = 0
    case waiting = 1
    case visited = 2
}

func breadthFirstSearch(_ adj: [[Int]], _ state: inout [nodeState], _ startNode: inout Int) -> [Int]
{
    let numNodes: Int = adj[0].count
    var myQueue = Queue<Int>()
    var resultArr: [Int] = []
    
    myQueue.enqueue(startNode)
    state[startNode] = .waiting
    
    while(!myQueue.isEmpty)
    {
        startNode = myQueue.dequeue()!
        resultArr.append(startNode)
        state[startNode] = .visited
        
        for i in 0..<numNodes
        {
            //printf("adj[%d][%d] == %d\n", v, i, adj[v][i]);
            if (adj[startNode][i] == 1 && state[i] == .initial)
            {
                myQueue.enqueue(i)
                state[i] = .waiting
            }
        }
    }
    
    return resultArr
}

func depthFirstSearch(_ adj: [[Int]], _ state: inout [nodeState], _ startNode: Int, _ resArray: inout [Int])
{
    let numNodes: Int = adj[0].count

    resArray.append(startNode)
    state[startNode] = .visited
    for i in 0..<numNodes {
        if(state[i] == .initial && adj[startNode][i] == 1) {
            depthFirstSearch(adj, &state, i, &resArray)
        }
    }
}

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return (left == nil) && (right == nil)
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }

    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    public func insert(_ value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    public func search(_ value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        } else {
            return self
        }
    }

}

func binarySearch<T: Comparable>(_ array: [T], _ key: T) -> Int? {
    var lowerBound: Int = 0
    var upperBound: Int = array.count
    
    //print("array[0] = \(array[0]), \(key)")
    while (lowerBound < upperBound) {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
                    
        if array[midIndex] < key {
            lowerBound = midIndex + 1
            print("lowerBound = \(lowerBound)")
        } else if array[midIndex] > key {
            upperBound = midIndex
            print("upperBound = \(upperBound)")
        } else {
            print("array[\(midIndex)] = \(array[midIndex]), key = \(key)")
            return midIndex
        }
    }
    
    return nil
}

func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
    for (index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}
