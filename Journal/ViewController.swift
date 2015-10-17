//
//  ViewController.swift
//  Journal
//
//  Created by Caleb Hicks on 9/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var entriesTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded viewController")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        entriesTable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailedView = segue.destinationViewController as? EntryDetailViewController {
            
            if segue.identifier == "addNewEntry"{ // if they click the new button
                
            } else { // if they click an entry cell
                
                if let index = self.entriesTable.indexPathForSelectedRow?.row {
                    
                    let entry = EntryController.singleton.entryArray[index]
                    
                    _ = detailedView.view
                    
                    detailedView.updateWithEntry(entry, index: index)
                
                }
                
            }
            
        }
        
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryController.singleton.entryArray.count
    
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("entryListCell", forIndexPath: indexPath)
        
        let entry: Entry = EntryController.singleton.entryArray[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timeStamp
        
        return cell

    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
        }
    }
    
}
