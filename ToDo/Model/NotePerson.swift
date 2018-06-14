//
//  NotePerson.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/11/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import Foundation

class NotePerson{
    var id:Int
    var idNote:Int
    var idPerson:Int
    
    init(id:Int, idNote:Int, idPerson:Int) {
        self.id = id
        self.idNote = idNote
        self.idPerson = idPerson
    }
}
