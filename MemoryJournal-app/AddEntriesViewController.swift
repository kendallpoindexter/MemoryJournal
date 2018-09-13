//
//  AddEntriesViewController.swift
//  MemoryJournal-app
//
//  Created by Kendall Poindexter on 9/12/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

protocol AddEntriesViewControllerDelegate: class {
    func addEntries(controller: AddEntriesViewController, finishAdding entry: JournalEntries)
}

class AddEntriesViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var userTitle: UITextField!
    @IBOutlet weak var userDate: UITextField!
    @IBOutlet weak var userText: UITextView!
    
    //MARK: - Properties
    
    weak var delegate: AddEntriesViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    @IBAction func doneAdding(_ sender: UIBarButtonItem) {
        
        guard let title = userTitle.text,
            let date = userDate.text,
            let text = userText.text else {return}
        
        let newJournalEntries = JournalEntries(title: title, content: text, date: date)

        delegate?.addEntries(controller: self, finishAdding: newJournalEntries)
    }
    

    

}
