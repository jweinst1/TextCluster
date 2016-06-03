//
//  readfile.swift
//  TextCluster
//
//  Created by Joshua Weinstein on 6/3/16.
//  Copyright © 2016 Joshua Weinstein. All rights reserved.
//

import Foundation

//function to read UTF-8 style text from a file
func getFileString(filename:String) -> String {
    let fileLocation = NSBundle.mainBundle().pathForResource(filename, ofType: "txt")!
    let text : String
    do
    {
        text = try String(contentsOfFile: fileLocation)
        return text
    }
    catch
    {
        text = ""
        return text
    }
}