//
//  Format.swift
//  TextCluster
//
//  Created by Joshua Weinstein on 6/3/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//set of static functions to format for file writing or printing
class Formatters {
    
    static func formatStringMap(arg:StringMap) -> String {
        var formatstr = ""
        for key in arg.indexes.keys {
            formatstr += key + "=>" + String(arg.indexes[key]!) + "\n"
        }
        return formatstr
    }
    
    static func formatIndexMap(arg:IndexMap) -> String {
        var formatstr = ""
        for key in arg.imap.keys {
            formatstr += String(key) + "=>" + arg.imap[key]! + "\n"
        }
        return formatstr
    }
}