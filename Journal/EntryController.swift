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
    
    var entryArray: [Entry] = [Entry(title: "Declaration", bodyText: "We the people of the United States...")]
    
    func addEntry(entry: Entry){
        self.entryArray.append(entry)
    }
    
    func removeEntry(specified: Entry) -> () {
        
        if let index = self.entryArray.indexOf(specified) {
            self.entryArray.removeAtIndex(index)
        }
        
    }
    
}




