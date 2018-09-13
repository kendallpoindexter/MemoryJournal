//
//  JournalEntriesDetailViewController.swift
//  MemoryJournal-app
//
//  Created by Kendall Poindexter on 9/13/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class JournalEntriesDetailViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    
    //MARK: - Properties
    var journalEntry = JournalEntry()
    
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
    navigationItem.title = journalEntry.title
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
