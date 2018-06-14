//
//  Product.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/5/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import Foundation
class Product{
    var id: Int
    var name:String
    var productCategory: ProductCategory
    
    init(id:Int, name:String, productCategory:ProductCategory) {
        self.id = id
        self.name = name
        self.productCategory = productCategory
    }
}
