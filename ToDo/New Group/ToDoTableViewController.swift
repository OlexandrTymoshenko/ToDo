//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/5/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var notes:[Note] = []
    let repo = Repository.noteRepository
    //var toDoCurrent:Note = Note(title: "mainTodo", toDoType: ToDoType.Buylist)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        //nr.Create(note: Note(Id: 9, Title: "asdTitle", Text: "asdtext", NoteType: NoteType.Buylist))
        self.notes = repo.GetAll()
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

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return toDos.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as! ImageLabelTableViewCell
        cell.cellLabel.text = notes[indexPath.row].Title
        
        var i = notes[indexPath.row].NoteType.rawValue
        var str = NoteType.strings[i]
        var im = UIImage(named: str)
        cell.cellImage?.image = im
        
        cell.imageView?.image = im
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Delete the row from the data source
            repo.Delete(id: self.notes[indexPath.row].Id)
            self.notes = repo.GetAll()
            tableView.reloadData()
        }
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//            toDos.append("new Item")
//            tableView.reloadData()
//        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier! == "ToDoItemSegue"){
        var toDoController = segue.destination as! ToDoViewController
            var row = tableView.indexPathForSelectedRow?.row
            toDoController.note = self.notes[row!]
            toDoController.isUpdate = true
        }
        else if (segue.identifier! == "AddNewToDoItemSegue"){
            var c = segue.destination as! ToDoViewController
            //var row = tableView.indexPathForSelectedRow?.row
            c.note = Note(Id: 1, Title: "", Text: "1", NoteType: NoteType.Buylist)
            c.isUpdate = false
        }
        
    }
}
