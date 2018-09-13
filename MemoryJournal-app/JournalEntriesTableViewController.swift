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
    var selectedJournal: JournalEntry?

    
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
    
    //MARK: - Methods
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        func swipeToDelete(indexPath: IndexPath) {
            journal.entries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            swipeToDelete(indexPath: indexPath)
        }
        
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newMemoriesSegue"{
            guard let addEntriesViewController = segue.destination as? AddEntriesViewController else { return }
            addEntriesViewController.delegate = self
        } else if segue.identifier == "memoryDetailSegue" {
            guard let journalEntriesDetailViewController = segue.destination as? JournalEntriesDetailViewController else {return}
            journalEntriesDetailViewController.journalEntry = selectedJournal!
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

//MARK: - UITableViewDelegate protocols

extension JournalEntriesTableViewController {
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedJournal = journal.entries[indexPath.row]
        return indexPath
    }
}

//MARK: - AddEntriesViewControllerDelegate Protocols

extension JournalEntriesTableViewController: AddEntriesViewControllerDelegate {
    func addEntries(controller: AddEntriesViewController, finishAdding entry: JournalEntry) {
        let newRowIndex = journal.entries.count
        journal.entries.append(entry)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
