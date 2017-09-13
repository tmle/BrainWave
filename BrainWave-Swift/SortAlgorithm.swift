//
//  SortAlgorithm.swift
//  SwiftAlgorithm
//
//  Created by Thinh Le on 2017-07-18.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [T] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

//func quickSort2(_ array:[Int]) -> [Int] {
//    guard array.count > 1 else { return array }
//    
//    let pivotValue = array[0]
//    let listStripped = array.count > 1 ? array[1...array.count-1] : []
//    let smaller = filter(listStripped, { $0 <= pivotValue })
//    let greater = filter(listStripped, { $0 > pivotValue })
//    
//    return quickSort2(smaller) + Array(arrayLiteral:pivotValue) + quickSort2(greater)
//}

func quickSort<T: Comparable>(_ array: inout [T], _ lo: Int, _ hi: Int)
{
    if lo < hi {
        
        let pivot = partition(&array, lo, hi)
        print(pivot)
        quickSort(&array, lo, pivot)
        quickSort(&array, pivot + 1, hi)
        
    }
}

private func partition<T: Comparable>(_ array: inout [T], _ lo: Int, _ hi: Int) -> Int {
    
    let pivot = array[lo]
    var i = lo - 1
    var j = hi + 1
    
    while true {
        i += 1
        while array[i] < pivot {
            print("\(array[i]), \(pivot)")
            i += 1
        }
        j -= 1
        while array[j] > pivot {
            print("\(array[i]), \(pivot)")
            j -= 1
        }
        
        if i >= j {
            return j
        }
        swap(&array[i], &array[j])
    }
    
}

func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T]
{
    guard array.count > 1 else {return array}
    
    var a = array
    
    for i in 1..<a.count {
        var j = i
        while j > 0 && isOrderedBefore(a[j], a[j-1]) {
            swap(&a[j-1], &a[j])
            j -= 1;
        }
    }
    return a
}

func selectionSort<T>(_ array: [T], _ isOrderedBefore: (T,T) -> Bool) -> [T]
{
    guard array.count > 1 else {return array}
    
    var a = array
    var idxExtremum = 0 //idxExtremum is idx of Min for the ascending sort, and idx of Max for descending sort.

    for i in 0..<a.count
    {
        idxExtremum = i
        for j in i+1..<a.count
        {
            if isOrderedBefore(a[j], a[idxExtremum])
            {
                idxExtremum = j
            }
        }
        
        if (idxExtremum != i)
        {
            swap(&a[i], &a[idxExtremum])
        }
        
    }
    return a
}

func bubbleSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T]
{
    guard array.count > 1 else {return array}

    var a = array
    var swapped: Bool = true
    
    while (swapped)
    {
        swapped = false
        for i in 1..<a.count {
            //let tmp = a[i]
            if isOrderedBefore(a[i], a[i-1])
            {
                swap(&a[i-1], &a[i])
                swapped = true
            }
        }
    }
    return a
}
