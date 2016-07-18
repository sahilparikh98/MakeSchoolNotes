//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController
{
    @IBOutlet weak var noteTitleTextField: UITextField!

    @IBOutlet weak var noteContextTextView: UITextView!
    
    var note: Note?
    
  override func viewDidLoad()
  {
    super.viewDidLoad()
  }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        if segue.identifier == "Save"
        {
            print("Save button tapped")
            if let note = note
            {
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContextTextView.text ?? ""
                
                RealmHelper.updateNote(note, newNote: newNote)
            }
            else
            {
                let note = Note()
                
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContextTextView.text ?? ""
                note.modificationTime = NSDate()
                
                RealmHelper.addNote(note)
            }
            listNotesTableViewController.notes = RealmHelper.retrieveNotes()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let note = note
        {
            noteTitleTextField.text = note.title
            noteContextTextView.text = note.content
        }
        else
        {
            noteTitleTextField.text = ""
            noteContextTextView.text = ""
        }
        
    }

}
