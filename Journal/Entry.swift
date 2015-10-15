//
//  Entry.swift
//  Journal
//
//  Created by Benjamin Patch on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    let timeStamp: String
//    let timeStamp: NSDate
    let title: String
    let bodyText: String
    
    init(timeStamp: String, title: String, bodyText: String){
        
        // Consider setting a default value for timeStamp
        
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
    init(title: String, bodyText: String) {
        
        self.timeStamp = "July 4, 1776"
        self.title = title
        self.bodyText = bodyText

    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ((lhs.timeStamp == rhs.timeStamp) && (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText))
}







