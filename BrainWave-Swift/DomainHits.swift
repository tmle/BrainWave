//
//  DomainHits.swift
//  BrainWave-Swift
//
//  Created by Thinh Le on 2017-07-19.
//  Copyright © 2017 Thinh Le. All rights reserved.
//

import Foundation

// this function takes a list of (hits, domainName) and tabulates
// the partial/full domain names with their respective hits.
// An example of input/output as follow:
// Input:
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
// Output:
//1320 com
//900 google.com
//410 yahoo.com
//60 mail.yahoo.com
//50 sports.yahoo.com
//10 mobile.sports.yahoo.com
//10 stackoverflow.com
//3 wikipedia.org
//3 org
//2 en.wikipedia.org
//1 es.wikipedia.org
//

func domainHits(_ array: Array<String>) -> Dictionary<String, Int> {
    var dict = [String:Int]()
    var tempStr = ""
    
    for i in 0 ... array.count-1 {
        tempStr = array[i]
        //print(array[i])
        let kURL = tempStr.components(separatedBy: ",")
        let numOccurences = Int(kURL[0])
        let subDomain = kURL[1]
        let segmentedURL = subDomain.components(separatedBy: ".")
        //print("\(numOccurences!), \(segmentedURL)")
        
        var ending = ""
        for j in (1 ... segmentedURL.count).reversed() {
            if (j==segmentedURL.count) {
                ending = segmentedURL.last!
                var tmpNum = 0
                if ((dict[ending]) != nil) {
                    tmpNum = numOccurences! + Int(dict[ending]!);
                    dict[ending] = tmpNum
                } else {
                    dict[ending] = numOccurences
                }
            }
            else {
                ending = segmentedURL[j-1] + "." + ending
                var tmpNum = 0
                if ((dict[ending]) != nil) {
                    tmpNum = numOccurences! + Int(dict[ending]!);
                    dict[ending] = tmpNum
                }
                else {
                    dict[ending] = numOccurences
                }
            }
        }
        
    }
    
    return dict
}
