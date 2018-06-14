//
//  ViewController.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/4/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //var toDo:Note = Note(title: "asd", toDoType: ToDoType.Meeting)
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!

    var isUpdate = false
    var note:Note = Note(Id: 1, Title: "", Text: "", NoteType: NoteType.Buylist)
    
    @IBAction func saveBtnEventHandler(_ sender: Any) {
        self.note.Title = textField.text!
        self.note.Text = textView.text!
        //self.note.NoteType = pickerView.selectedRow()
        
        if isUpdate{
            Repository.noteRepository.Update(note: self.note)
        } else{
            let id = Repository.noteRepository.GetAll().last!.Id+1
            self.note.Id = id
            Repository.noteRepository.Create(note: self.note)
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NoteType.strings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NoteType.strings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.note.NoteType = NoteType(rawValue: row+1)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self

        textField.text = self.note.Title
        textView.text = self.note.Text
        
        var d = self.note.NoteType.rawValue
        pickerView.selectRow(d, inComponent:0, animated:true)
        
    }
}
