//
//  JournalEntriesTableViewController.swift
//  MemoryJournal-app
//
//  Created by Kendall Poindexter on 9/12/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class JournalEntriesTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var journal = Journal()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journal.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titles", for: indexPath)
        
        cell.textLabel?.text = journal.entries[indexPath.row].title
        // Configure the cell...

        return cell
    }
    
    //MARK: - Actions
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

//MARK: - AddEntriesViewControllerDelegate Protocols

extension JournalEntriesTableViewController: AddEntriesViewControllerDelegate {
    func addEntries(finishAdding entry: JournalEntries) {
        <#code#>
    }
    
    
}
