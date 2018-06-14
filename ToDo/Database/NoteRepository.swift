//
//  NoteRepository.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/12/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import Foundation
import SQLite3

class NoteRepository{
    func GetAll() -> [Note]{
        var notes:[Note] = []
        let queryStatementString:String = "SELECT * FROM Note;"
        var queryStatement: OpaquePointer? = nil
        var st = sqlite3_prepare_v2(Repository.db, queryStatementString, -1, &queryStatement, nil)
        if st == SQLITE_OK {
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                let id = sqlite3_column_int(queryStatement, 0)
                let queryResultCol1 = sqlite3_column_text(queryStatement, 1)
                let title = String(cString: queryResultCol1!)
                let type = sqlite3_column_int(queryStatement, 2)
                let queryResultCol3 = sqlite3_column_text(queryStatement, 3)
                let text = String(cString: queryResultCol3!)
                let noteType = NoteType(rawValue:Int(type-1))
                notes.append(Note(Id: Int(id), Title: title, Text: text, NoteType: noteType! ))
            }
            
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return notes
    }
    
    func Create(note:Note){
        var insertStatement: OpaquePointer? = nil
        let query:String = "INSERT INTO Note VALUES(?,?,?,?)"
            if sqlite3_prepare_v2(Repository.db, query, -1, &insertStatement, nil) == SQLITE_OK {
                let id: Int32 = Int32(note.Id)
                let title: NSString = note.Title as NSString
                let type:Int32 = Int32(note.NoteType.rawValue)
                let text: NSString = note.Text as NSString
                // 2
                sqlite3_bind_int(insertStatement, 1, id)
                sqlite3_bind_text(insertStatement, 2, title.utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 3, type)
                sqlite3_bind_text(insertStatement, 4, text.utf8String, -1, nil)
                // 4
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    func Update(note: Note){
        var insertStatement: OpaquePointer? = nil
    
        let query:String = "UPDATE Note SET Title = ?, Type = ?, Text = ? WHERE Id = ?"
        let isOk = sqlite3_prepare_v2(Repository.db, query, -1, &insertStatement, nil)
        if isOk == SQLITE_OK {
            let id: Int32 = Int32(note.Id)
            let title: NSString = note.Title as NSString
            let type:Int32 = Int32(note.NoteType.rawValue)
            let text: NSString = note.Text as NSString
            // 2
            
            sqlite3_bind_text(insertStatement, 1, title.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 2, type)
            sqlite3_bind_text(insertStatement, 3, text.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 4, id)
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not update row.")
            }
        } else {
            print("Update statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    func Delete(id: Int){
        var insertStatement: OpaquePointer? = nil
        
        let query:String = "DELETE FROM Note WHERE Id = ?"
        if sqlite3_prepare_v2(Repository.db, query, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
        
    }
}
