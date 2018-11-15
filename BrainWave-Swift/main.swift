//
//  main.swift
//  BrainWave-Swift
//
//  Created by Thinh Le on 2017-07-19.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

//=== Test area ===
//16 hashTable
var hashTable = HashTable<String, String>(capacity: 31) //31
let letters: NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var licensePlateNumber: String = ""
let searchPlate: String = "5FAU288"
var numPlate: Int = 10000 // 9*26*26*26*1000 //5*26*26*26 //*26*26*26; // 25244537/2; // 9*26*26*1000; //9*26*26*26*1000 = 158,184,000;  9*26*26*1000 = 6084000
var firstDigit: Int

var start = DispatchTime.now()
for i in 0..<numPlate {
    let randomString : NSMutableString = NSMutableString(capacity: 3)

    for _ in 0..<3 {
        //var length = UInt32(letters.length)
        let randIndex = arc4random_uniform(26)
        randomString.appendFormat("%C", letters.character(at: Int(randIndex)))
    }

    firstDigit = Int(arc4random_uniform(5+1)) + 2
    if (firstDigit >= 2 ) {
        licensePlateNumber = String(format: "%d%@%.3d", firstDigit, randomString, arc4random_uniform(1000))
        hashTable[licensePlateNumber] = "Active"
    }

        if i == numPlate - 1 {
            hashTable["5FAU288"] = "Active"
        }

}
var end = DispatchTime.now()   // <<<<<<<<<<   end time
var nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds //
print("Time to generate a hashtable of \(numPlate) license plates is \(nanoTime/1000000) milli-seconds")

//print("5FAU288 is \(String(describing: hashTable.search(forKey:"5FAU288")!))")

start = DispatchTime.now()
print("Searching for \(searchPlate) ... \(String(describing: hashTable.search(forKey:searchPlate)!))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
print("Time to search for \(searchPlate) in \(numPlate) license plates is \(nanoTime/1000000) milli-seconds")

//=================

// 20 Recursion
//func printFirstNumbers(_ N: Int) {
//    if N > 1 {
//        printFirstNumbers(N - 1)
//    }
//    print(N)
//}

//printFirstNumbers(3)

// 19 String manipulation
//var myString = "Toi ten la Le Minh Thinh" // "Replace the letter e with *"
//var reversedString = ""
//var words: [String] = ["cam", "khong", "duoc", "do", "rac", " - ", "nguoi", "boc-lot", "nguoi"]
//var reversedWords: [String] = []
//
//for word in words.reversed() {
//    //var char = "\(character)"
//    reversedWords.append(word)
//}
//print(reversedWords)
//
//for character in myString.characters {
//    var char = "\(character)"
//    reversedString = char + reversedString
//}
//print(reversedString)

//var replacedString = ""
//for character in myString.characters {
//    var char = "\(character)"
//    if char == "e" {
//        replacedString = replacedString + "*"
//    } else {
//        replacedString = replacedString + char
//    }
//}
//print(replacedString)

// 17 findPrime
//let num = 2
//print("Is \(num) a prime number = \(MathOperation.isPrime(num))")
//var lo = 1
//let hi = 35
//print("List of prime numbers = \(MathOperation.findPrime(lo, hi))")


// 15 breadthFirstSearch depthFirstSearch
//let adjMatrix: [[Int]] = [[0, 1, 0, 1, 1, 0, 0, 0, 0],
//                          [0, 0, 1, 0, 1, 0, 0, 0, 0],
//                          [0, 0, 0, 0, 0, 1, 0, 0, 0],
//                          [0, 0, 0, 0, 1, 0, 1, 0, 0],
//                          [0, 0, 0, 0, 0, 1, 0, 1, 0],
//                          [0, 0, 0, 0, 0, 0, 0, 0, 0],
//                          [0, 0, 0, 0, 1, 0, 0, 1, 0],
//                          [0, 0, 0, 0, 0, 1, 0, 0, 1],
//                          [0, 0, 0, 0, 0, 0, 0, 0, 0]]
//
//var state: [nodeState] = [] //
//for i in 0..<adjMatrix[0].count {
//    state.append(.initial)
//}
//
//var startNode: Int = 0
//print("List of nodes found using BFS: \(breadthFirstSearch(adjMatrix, &state, &startNode))")
//
//startNode = 0
//var resArray: [Int] = []
//for i in 0..<adjMatrix[0].count {
//    state[i] = .initial
//}
//depthFirstSearch(adjMatrix, &state, startNode, &resArray)
//print("List of nodes found using DSF: \(resArray)")

// 14 foundRect
//var image: [[Int]] = [[1, 1, 1, 1, 1, 1, 1, 1, 1],
//                      [1, 1, 1, 1, 1, 1, 1, 1, 1],
//                      [1, 1, 1, 1, 0, 0, 0, 0, 1],
//                      [1, 1, 1, 1, 0, 0, 0, 0, 1],
//                      [1, 1, 1, 1, 0, 0, 0, 0, 1],
//                      [1, 1, 1, 1, 1, 1, 1, 1, 1]]
//
//var x1 = 0
//var y1 = 0
//var x2 = 0
//var y2 = 0
//
//(x1, y1, x2, y2) = ArrayOperation.findRect(image)
//print("A[\(x1), \(y1)], B[\(x2), \(y2)]")

// 13 DCT computation
//let matrix =   [[255.0, 255.0],
//                [255.0, 255.0]]

//let matrix =   [[255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0],
//                [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0],
//                [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0],
//                [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0],
//                [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0],
//                [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0],
//                [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0],
//                [255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0, 255.0]]
//
//MathOperation.dctTransform(matrix);

// 12 fiboSeries
//let a = 20
//print("fiboSeries of \(a) terms is: \(MathOperation.fiboSeries(a))")

// 11 factorial
//let a = 5
//print("factorial of \(a) is \(MathOperation.factorial(a))")

// 10 time Tables
//for i in 1...15 {
//    let mults = timeTables(i)
//    print("table: \(mults.one)\t, \(mults.two)\t, \(mults.three)\t, \(mults.four)\t, \(mults.five)\t, \(mults.six)\t, \(mults.seven)\t, \(mults.eight)\t, \(mults.nine)\t, \(mults.ten)\t, \(mults.eleven)\t, \(mults.twelve)\t \(mults.thirteen)\t \(mults.fourteen)\t \(mults.fifteen)\t")
//}

// 9 Math ops
//let a = 2.0
//let b = 3.0
//print("a: \(Int(a)) is Odd:  \(MathOperation.isOdd(Int(a)))")
//print("a: \(Int(a)) is Even: \(MathOperation.isEven(Int(a)))")
//print("b: \(Int(b)) is Odd:  \(MathOperation.isOdd(Int(b)))")
//print("b: \(Int(b)) is Even: \(MathOperation.isEven(Int(b)))")
//print("a: \(a) + b:  \(b) = \(MathOperation.sum(a,b))")
//print("a: \(a) - b:  \(b) = \(MathOperation.dif(a,b))")
//print("a: \(a) * b:  \(b) = \(MathOperation.mul(a,b))")
//print("a: \(a) / b:  \(b) = \(round(MathOperation.div(a,b)*1000)/1000)")

// 8 shape
//var myCircle = Circle(radius: 5)
//print("myCircle area = \(round((myCircle.area()*100))/100)")
//
//var mySquare = Square(side: 5)
//print("mySquare area = \(mySquare.area())")
//
//var myRect = Rectangle(length: 5, width: 5)
//print("myRect area = \(myRect.area())")
//
//var myShapes : [Shape] = [Circle(radius: 5), Square(side: 5), Rectangle(length: 5, width: 5)]
//var totalArea:Float = 0.0
//var totalPeri:Float = 0.0
//for shape in myShapes {
//    totalArea += shape.area()
//    totalPeri += shape.perimeter()
//}
//
//print("total area is \(round((totalArea*100))/100), and total perimeter is \(round((totalPeri*100))/100)")

// 7 - domainHits
//let array = [
//    "900,google.com",
//    "60,mail.yahoo.com",
//    "10,mobile.sports.yahoo.com",
//    "40,sports.yahoo.com",
//    "300,yahoo.com",
//    "10,stackoverflow.com",
//    "2,en.wikipedia.org",
//    "1,es.wikipedia.org"]
//
//var domainHitsDict = [String:Int]()
//
//domainHitsDict = domainHits(array);
//let sortedArray = domainHitsDict.sorted { $0.value > $1.value }
//
//for (key, value) in sortedArray {
//    print("\(value) \(key)")
//}

// 6 binarySearchTree - not tested
//let tree = BinarySearchTree<Int>(value: 7)
//tree.insert(2)
//tree.insert(5)
//tree.insert(10)
//tree.insert(9)
//tree.insert(1)
//
//tree.search(5)

//if let edges = dungeon.breadthFirstSearch(from: entranceRoom, to: treasureRoom) {
//    for edge in edges {
//        print("\(edge.source) -> \(edge.destination)")
//    }
//}

// 5 binarySearch - of ordered list
//let array = [2, 4, 5, 6, 7, 9, 12, 13]
//let searchNum:Int = 13
//print("found \(searchNum) at index \(binarySearch(array, searchNum)!)")
//let students = ["Fern", "Nora", "Rainer", "Ryan", "Sophia", "Thanh", "Xuan"]
//let searchStr:String = "Xuan"
//print("found \(searchStr) at index \(binarySearch(students, searchStr)!)")
//
// 4 bubbleSort, selectionSort insertionSort quickSort mergeSort
//var array = [4, 3] //, 2, 4, 5, 1, 7]
//var students = ["Nora", "Xuan", "Fern", "Ryan", "Rainer"]
//students.sort(by: <)
//print(students)
//print("\(quickSort(&array, 0, 1))") // quickSort dn work
//print("\(quickSort(&students, 0, 4))") // quickSort dn work

//print("\(mergeSort(array))")
//print("\(mergeSort(students))")

// 3 queue
//var myQueue = Queue<Int>()
//myQueue.enqueue(10)
//myQueue.enqueue(5)
//myQueue.enqueue(1)
//print("\(myQueue)")
//print("Front of myQueue is \(myQueue.front!), and item being dequeued is: \(myQueue.dequeue()!)")
//print("Front of myQueue is \(myQueue.front!), and item being dequeued is: \(myQueue.dequeue()!)")
//print("Front of myQueue is \(myQueue.front!), and item being dequeued is: \(myQueue.dequeue()!)")
//print("Front of myQueue is \(myQueue.front), and item being dequeued is: \(myQueue.dequeue())")

// 2 stack
//var myStack = Stack<Int>()
//myStack.push(1)
//myStack.push(2)
//myStack.push(3)
//myStack.push(4)
//myStack.push(5)
//
//var newIntStack = myStack
//print("Stacks before popping from new stack original: \(myStack) new: \(newIntStack)")
//newIntStack.pop()
//print("Stacks after popping from new stack original: \(myStack) new: \(newIntStack)")
//
//var strStack = Stack<String>()
//strStack.push("I")
//strStack.push("love")
//strStack.push("no one")
//var newStrStack = strStack
//print("Stacks before popping from new stack original: \(strStack) new: \(newStrStack)")
//print("pop \(newStrStack.pop()!) out of stack")
//print("push \(newStrStack.push("HTX")) onto the stack")
//print("Stacks after popping from new stack original: \(strStack) new: \(newStrStack)")

// 1 linear search
//let array = [5, 2, 4, 7]
//let students = ["Nora", "Fern", "Ryan", "Rainer"]
//let searchName:String = "Ryan"
//print("found at index \(linearSearch(students, "Ryan")!)")
//print("found \(searchName) at index \(linearSearch2(students, "Ryan")!)")

