//
//  Tools.swift
//  TextCluster
//
//  Created by Joshua Weinstein on 6/3/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

struct StringMap {
    let string:String
    var indexes:[String:[Int]]
    let substrs:[String]
    let substrset:Set<String>
    
    init(string:String, substrs:[String]){
        self.string = string
        self.substrs = substrs
        self.indexes = [String:[Int]]()
        let chars = Array(string.characters)
        //easy to access set of substrs you want to map
        self.substrset = Set<String>(substrs)
        
        let length = self.string.characters.count
        
        //initialize index map
        for elem in self.substrs {
            self.indexes[elem] = [Int]()
        }
        
        
        //repeating loop to get substr indexes
        for phrase in self.substrs {
            var substart = 0
            var subend = phrase.characters.count-1
            //intermediate loop to cut substrs of specific sizes
            while subend < length {
                let slice = String(chars[substart...subend])
                if slice == phrase {
                    self.indexes[slice]!.append(substart)
                }
                substart += 1
                subend += 1
            }
        }
    }
    
    //gets the indexes at which a word appears in a body of text
    func getIndexes(string:String) -> [Int] {
        return self.indexes[string]!
    }
    //checks if string requested is in the map
    func hasString(string:String) -> Bool {
        return self.indexes[string]!.isEmpty
    }
}

class DistanceFuncs {
    //calculates max distance between strings in a text
    static func maxDistance(map:StringMap, first:String, second:String) -> Int {
        let firstindexes = map.getIndexes(first)
        let secondindexes = map.getIndexes(second)
        if !firstindexes.isEmpty && !secondindexes.isEmpty {
            return abs(firstindexes[0] - secondindexes[secondindexes.count-1])
        }
        else {
            return 0
        }
    }
}

//struct that mapes all string indexes in a linear arrangement, so the index value can be compared directly
//may not work for substrings which are a substring of one another, such as "and" and "an"
struct IndexMap {
    let strings:Set<String>
    let text:String
    var imap:[Int:String]
    
    init(arg:StringMap) {
        self.strings = arg.substrset
        self.text = arg.string
        self.imap = [Int:String]()
        
        for key in arg.indexes.keys {
            for i in arg.indexes[key]! {
                self.imap[i] = key
            }
        }
    }
    
}