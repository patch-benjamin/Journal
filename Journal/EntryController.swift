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
    
    var entryArray: [Entry] = []
    
    let entryArrayKey: String = "entryArray"
    
    // MARK: INITIALIZER
    init() {
        self.entryArray = []
        loadFromPersistentStorage()
    }

    // MARK: ADD
    func addEntry(entry: Entry){
        self.entryArray.append(entry)
        saveToPersistentStorage()
    }
    
    // MARK: REMOVE
    func removeEntry(specified: Entry) -> () {
        
        if let index = self.entryArray.indexOf(specified) {
            self.entryArray.removeAtIndex(index)
            saveToPersistentStorage()
        }
        
    }
    
    
    func updateEntry(entry: Entry, index: Int) -> () {
        
        self.entryArray[index] = entry
        print("\(entryArray[0].title), \(entryArray[0].timeStamp), \(entryArray[0].bodyText)")
        
    }
    
    // MARK: SAVE
    
    func saveToPersistentStorage() {
        let entries = self.entryArray.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setValue(entries, forKey: self.entryArrayKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    // MARK: LOAD
    
    func loadFromPersistentStorage() {
        
        if let entries = NSUserDefaults.standardUserDefaults().objectForKey(self.entryArrayKey) as? [ [String: AnyObject] ] {
            
            
            self.entryArray = entries.map({Entry(dictionary: $0)!})
        }
    }
    
}




