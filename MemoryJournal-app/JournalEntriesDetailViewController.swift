//
//  JournalEntriesDetailViewController.swift
//  MemoryJournal-app
//
//  Created by Kendall Poindexter on 9/13/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

//MARK: - JournalEntriesDetailViewController delegate protocols

protocol JournalEntriesDetailViewControllerDelegate: class {
    func saveEdit(_controller: JournalEntriesDetailViewController, finishEditing entry: JournalEntry)
}

class JournalEntriesDetailViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    //MARK: - Properties
    var journalEntry = JournalEntry()
    weak var delegate: JournalEntriesDetailViewControllerDelegate?
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDetailView()

        // Do any additional setup after loading the view.
    }

   
    
    //MARK: - Methods
    
    func populateDetailView() {
    dateTextField.text = journalEntry.date
    contentTextView.text = journalEntry.content
    titleTextField.text = journalEntry.title
    }
    
    func editedDetailView() {
        journalEntry.date = dateTextField.text
        journalEntry.content = contentTextView.text
        journalEntry.title = titleTextField.text
    }

    //MARK: - Actions
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        editedDetailView()
        let editedEntry = journalEntry
        
        delegate?.saveEdit(_controller: self, finishEditing: editedEntry)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

    


