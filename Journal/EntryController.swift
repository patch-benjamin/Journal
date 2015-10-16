//
//  EntryController.swift
//  Journal
//
//  Created by Benjamin Patch on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation


class EntryController {
    
    static let singleton = EntryController()
    
    var entryArray: [Entry] = [
        Entry(title: "Declaration", bodyText: "We the people of the United States..."), // 0
        Entry(title: "Constitution", bodyText: "in order to form a more perfect union..."), // 1
        Entry(title: "Love", bodyText: "It's all you need..."), //2
        Entry(title: "Apple", bodyText: "Not oranges..."), //3
    ]
    
    func addEntry(entry: Entry){
        self.entryArray.append(entry)
    }
    
    func removeEntry(specified: Entry) -> () {
        
        if let index = self.entryArray.indexOf(specified) {
            self.entryArray.removeAtIndex(index)
        }
        
    }
    
    func updateEntry(entry: Entry, index: Int) -> () {
        
        self.entryArray[index] = entry
        print("\(entryArray[0].title), \(entryArray[0].timeStamp), \(entryArray[0].bodyText)")
        
    }

    
}




