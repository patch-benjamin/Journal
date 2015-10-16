//
//  Entry.swift
//  Journal
//
//  Created by Benjamin Patch on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class Entry: NSObject, NSCoding {
    
    static let timeStampKey: String = "timeStamp"
    static let titleKey: String = "title"
    static let bodyTextKey: String = "bodytext"
    
    
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
    
    convenience init?(dictionary : [String: AnyObject]) {
        guard let timeStamp = dictionary[Entry.timeStampKey] as? String,
        title = dictionary[Entry.titleKey] as? String,
        bodyText = dictionary[Entry.bodyTextKey] as? String
        else {
            
            return nil
        }
        self.init(timeStamp: timeStamp, title: title, bodyText: bodyText)
    }
    
    // Dictionary Copy Method
    func dictionaryCopy() -> [String: AnyObject] {
        return [
            Entry.timeStampKey: self.timeStamp,
            Entry.titleKey: self.title,
            Entry.bodyTextKey: self.bodyText
        ]
    }
    
    // MARK: NSCoding
    
    required convenience init? (coder: NSCoder){
        return nil
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
    }

    
}


func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ((lhs.timeStamp == rhs.timeStamp) && (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText))
}






