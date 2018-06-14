//
//  NoteProduct.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/11/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import Foundation

class NoteProduct{
    var id:Int
    var idNote:Int
    var idProduct:Int
    
    init(id:Int, idNote:Int, idProduct:Int) {
        self.id = id
        self.idNote = idNote
        self.idProduct = idProduct
    }
}
