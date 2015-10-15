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
     
        if let existingEntry = entry{
           
            
            
        } else {
            
            
            
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension EntryDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //Hide the keyboard
        
        textField.resignFirstResponder()
    
        return true
    
    }
    
    
    
}