//
//  ToDo.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/5/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import Foundation

class Note{
    var Id: Int
    var Title: String
    var Text: String
    var NoteType: NoteType
    
    init(Id:Int,Title:String,Text:String, NoteType:NoteType) {
        self.Id = Id
        self.Title = Title
        self.NoteType = NoteType
        self.Text = Text
    }
}
