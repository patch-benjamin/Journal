//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Benjamin Patch on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    // MARK: Properties
    
    var entry: Entry?
    var index: Int? // index for entry just above
    
    // MARK: Outlets
    
    @IBOutlet weak var entryTitle: UITextField!
    
    @IBOutlet weak var entryBody: UITextView!
    
    
    
    // MARK: Actions
    // TODO: text this button.
    @IBAction func clearContent(sender: UIButton) {
        
        entryBody.text = ""
        entryTitle.text = ""
        
    }
    
    @IBAction func saveEntry(sender: UIBarButtonItem) {
     
        if let existingEntry = entry, existingIndex = index{ // update the entry
            // create new entry with data from view
            // send the new entry to replace the old entry
            
//            print("update entry: \(existingEntry.title) at index: \(existingIndex)")
            let updatedEntry = Entry(title: entryTitle.text!, bodyText: entryBody.text!)
            
            EntryController.singleton.updateEntry(updatedEntry, index: existingIndex)
            
        } else { // add new entry
            print("Add entry")
            
                EntryController.singleton.addEntry(Entry(title: entryTitle.text!, bodyText: entryBody.text!))

        }

        // go back to the list.
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateWithEntry (entry: Entry, index: Int){
        
        self.entry = entry
        self.index = index
        entryTitle.text = "\(entry.title)"
        entryBody.text = "\(entry.bodyText)"
        
    }
    
}

extension EntryDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //Hide the keyboard
        
        textField.resignFirstResponder()
    
        return true
    
    }
    
    
    
}