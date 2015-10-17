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
    
    @IBOutlet weak var saveButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var entryTitle: UITextField!
    
    @IBOutlet weak var entryBody: UITextView!
    
    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Actions
    @IBAction func clearContent(sender: UIButton) {
        
        entryBody.text = ""
        entryTitle.text = ""
        saveButtonItem.enabled = false
    }
    
    @IBAction func saveEntry(sender: UIBarButtonItem) {
        
        // UPDATE EXISTING ENTRY
        if let existingEntry = entry, existingIndex = index{

            if let title = entryTitle.text, bodyText = entryBody.text{
                
                let updatedEntry = Entry(title: title, bodyText: bodyText)
                EntryController.singleton.updateEntry(updatedEntry, index: existingIndex)
                
            }
            
        }
        // ADD NEW ENTRY
        else {
            
            if let title = entryTitle.text, bodyText = entryBody.text{
                
                    EntryController.singleton.addEntry(Entry(title: title, bodyText: bodyText))
                
            }
            
        }

        // go back to the list.
        navigationController?.popViewControllerAnimated(true)

    }
    
    
    
    // MARK: Set Up Data
    
    func updateWithEntry (entry: Entry, index: Int){
        
        self.entry = entry
        self.index = index
        entryTitle.text = entry.title
        entryBody.text = entry.bodyText
        navBarTitle.title = entry.title
    }
    
}

extension EntryDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //Hide the keyboard
        
        textField.resignFirstResponder()
    
        return true
    
    }
    
    
    
    
}

// commmiteditingstyle in datasource

extension EntryDetailViewController: UITextViewDelegate{
    
    func checkEnableDisableSave(){
        if let title = entryTitle.text, bodyText = entryBody.text {
            if title != "" && bodyText != "" {
                saveButtonItem.enabled = true
            }
        }
    }
    
    // MARK: Textview/body
    func textViewDidEndEditing(textView: UITextView) {
        checkEnableDisableSave()
        textView.resignFirstResponder()
    }
    func textViewDidBeginEditing(textView: UITextView) {
        saveButtonItem.enabled = false
        
    }
    
    
    
    override func resignFirstResponder() -> Bool {
        return true
    }
    
    // MARK: TextField/title
    func textFieldDidEndEditing(textField: UITextField){
        checkEnableDisableSave()
        if let title = entryTitle.text {
            navBarTitle.title = title
        }
    }
}



/*

textFieldDidEndEditing
resignFirstResponder


*/