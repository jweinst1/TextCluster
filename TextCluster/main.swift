//
//  main.swift
//  TextCluster
//
//  Created by Joshua Weinstein on 6/3/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

let fstring = getFileString(Process.arguments[0])

let flag = Process.arguments[1]

if flag == "-p" {
    //converts remaining arguments
    let strings = Array(Process.arguments[2...Process.arguments.count-1])
    let smap = StringMap(string: fstring, substrs: strings)
    let imap = IndexMap(arg: smap)
    print("Evaluating the file \(fstring)\n")
    print(Formatters.formatStringMap(smap))
    print(Formatters.formatIndexMap(imap))
}

