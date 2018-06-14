	//
//  Repository.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/10/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import Foundation
import SQLite3

class Repository {
    
    
    static var initsValues = [
        """
CREATE TABLE IF NOT EXISTS UpdateStat (TableName TEXT,UpdateCount INTEGER NOT NULL DEFAULT 0,PRIMARY KEY(`TableName`));
""",
        """
INSERT INTO UpdateStat VALUES ('Note',2);
""",
        """
CREATE TABLE Product_Category (    Id   [INT]          NOT NULL,Name [VARCHAR] (50) NOT NULL,CONSTRAINT PK_Product_Category PRIMARY KEY (Id ASC));
""",
        """
INSERT INTO Product_Category VALUES (1,'Fish');
""",
        """
INSERT INTO Product_Category VALUES (4,'Fruits');
""",
        """
INSERT INTO Product_Category VALUES (3,'Vegetables');
""",
        """
INSERT INTO Product_Category VALUES (2,'Meat');
""",
        """
CREATE TABLE Product (Id[INT]NOT NULL, Name [VARCHAR] (50) NOT NULL, Id_Product_Category [INT] NOT NULL, CONSTRAINT PK_Product PRIMARY KEY ( Id ASC ),FOREIGN KEY (Id_Product_Category) REFERENCES Product_Category (Id) );
""",
        """
INSERT INTO Product VALUES (1,'Tuna',1);
""",
        """
INSERT INTO Product VALUES (2,'Chicken',2);
""",
        """
INSERT INTO Product VALUES (3,'Tomato',3);
""",
        """
INSERT INTO Product VALUES (4,'Apple',4);
""",
        """
INSERT INTO Product VALUES (5,'Orange',4);
""",
        """
CREATE TABLE Person (Id [INT] NOT NULL, Name [VARCHAR] (50) NOT NULL, CONSTRAINT PK_Person PRIMARY KEY (Id ASC));
""",
        """
INSERT INTO Person VALUES (1,'Ivan');
""",
        """
INSERT INTO Person VALUES (2,'Lex');
""",
        """
INSERT INTO Person VALUES (3,'Bob');
""",
        """
INSERT INTO Person VALUES (4,'Nick');
""",
        """
INSERT INTO Person VALUES (5,'Ann');
""",
        """
CREATE TABLE Note_Type (Id   [INT]          NOT NULL,Name [VARCHAR] (50) NOT NULL,CONSTRAINT PK_Note_Type PRIMARY KEY (    Id ASC),CONSTRAINT IX_Note_Type UNIQUE (    Name ASC));
""",
        """
INSERT INTO Note_Type VALUES (1,'Meeting');
""",
        """
INSERT INTO Note_Type VALUES (2,'Buylist');
""",
        """
INSERT INTO Note_Type VALUES (3,'Party');
""",
        """
CREATE TABLE Note (Id    [INT]   NOT NULL,Title [VARCHAR] (50) NOT NULL,Type  [INT]          NOT NULL,Text  [VARCHAR] (50) NOT NULL,CONSTRAINT PK_Note PRIMARY KEY (    Id ASC),FOREIGN KEY (    Type)REFERENCES Note_Type (Id) );
""",
        """
INSERT INTO Note VALUES (1,'Meeting with Ivan',1,'Meeting with Ivan to discuss  product');
""",
        """
INSERT INTO Note VALUES (2,'Buylist',2,'Items to buy in "ATB"');
""",
        """
INSERT INTO Note VALUES (3,'Lex''s birthday',3,'Lex''s birthday , dont forget to buy present');
""",
        """
INSERT INTO Note VALUES (4,'Farewell party',3,'Dont forget to buy products and set up environment');
""",
        """
CREATE TABLE Note_Product (Id [INT] NOT NULL,Id_Note    [INT] NOT NULL,Id_Product [INT] NOT NULL,CONSTRAINT PK_Note_Product PRIMARY KEY (    Id ASC),FOREIGN KEY (    Id_Note)REFERENCES Note (Id),FOREIGN KEY (    Id_Product)REFERENCES Product (Id) );
""",
        """
INSERT INTO Note_Product VALUES (1,3,5);
""",
        """
INSERT INTO Note_Product VALUES (2,4,4);
""",
        """
INSERT INTO Note_Product VALUES (3,4,3);
""",
        """
INSERT INTO Note_Product VALUES (4,4,2);
""",
        """
INSERT INTO Note_Product VALUES (5,4,1);
""",
        """
INSERT INTO Note_Product VALUES (6,2,3);
""",
        """
INSERT INTO Note_Product VALUES (7,2,2);
""",
        """
INSERT INTO Note_Product VALUES (8,2,1);
""",
        """
INSERT INTO Note_Product VALUES (9,2,5);
""",
        """
CREATE TABLE Note_Person (Id        [INT] NOT NULL,Id_Note   [INT] NOT NULL,Id_Person [INT] NOT NULL,CONSTRAINT PK_Note_Person PRIMARY KEY (    Id ASC),FOREIGN KEY (    Id_Note)REFERENCES Note (Id),FOREIGN KEY (    Id_Person)REFERENCES Person (Id) );
""",
        """
INSERT INTO Note_Person VALUES (1,3,2);
""",
        """
INSERT INTO Note_Person VALUES (2,4,1);
""",
        """
INSERT INTO Note_Person VALUES (3,4,3);
""",
        """
INSERT INTO Note_Person VALUES (4,4,4);
""",
        """
INSERT INTO Note_Person VALUES (5,4,5);
""",
        """
INSERT INTO Note_Person VALUES (6,1,1);
""",
        """
CREATE TRIGGER UpdateCounter AFTER UPDATE ON Note begin update UpdateStat set UpdateCount = ((select UpdateStat.UpdateCount From UpdateStat)+1); end;
""",
        """
CREATE VIEW Stat AS SELECT personName.Id_Person, personName.Id_Product,personName.Name as PersonName, product.Name as productName FROM (SELECT person_product.Id_Person, person_product.Id_Product, person.Name FROM (SELECT p.Id_Person, pr.Id_Product FROM [Note_Person] as p
 JOIN Note_Product as pr ON p.Id_Note = pr.Id_Note) as person_product JOIN Person as person ON person_product.Id_Person = person.Id) as personName JOIN Product as product ON product.Id = personName.Id_Product;
"""]
    
    static var dbInitializationScript = """
CREATE TABLE IF NOT EXISTS UpdateStat (
 TableName TEXT,
 UpdateCount INTEGER NOT NULL DEFAULT 0,
 PRIMARY KEY(`TableName`)
);
INSERT INTO UpdateStat VALUES ('Note',2);
"""
    let asd = """
CREATE TABLE Product_Category (
    Id   [INT]          NOT NULL,
    Name [VARCHAR] (50) NOT NULL,
    CONSTRAINT PK_Product_Category PRIMARY KEY (
        Id ASC
    )
);
INSERT INTO Product_Category VALUES (1,'Fish');
INSERT INTO Product_Category VALUES (4,'Fruits');
INSERT INTO Product_Category VALUES (3,'Vegetables');
INSERT INTO Product_Category VALUES (2,'Meat');

CREATE TABLE Product (
    Id                  [INT]          NOT NULL,
    Name                [VARCHAR] (50) NOT NULL,
    Id_Product_Category [INT]          NOT NULL,
    CONSTRAINT PK_Product PRIMARY KEY (
        Id ASC
    ),
    FOREIGN KEY (
        Id_Product_Category
    )
    REFERENCES Product_Category (Id)
);
INSERT INTO Product VALUES (1,'Tuna',1);
INSERT INTO Product VALUES (2,'Chicken',2);
INSERT INTO Product VALUES (3,'Tomato',3);
INSERT INTO Product VALUES (4,'Apple',4);
INSERT INTO Product VALUES (5,'Orange',4);

CREATE TABLE Person (
    Id   [INT]          NOT NULL,
    Name [VARCHAR] (50) NOT NULL,
    CONSTRAINT PK_Person PRIMARY KEY (
        Id ASC
    )
);
INSERT INTO Person VALUES (1,'Ivan');
INSERT INTO Person VALUES (2,'Lex');
INSERT INTO Person VALUES (3,'Bob');
INSERT INTO Person VALUES (4,'Nick');
INSERT INTO Person VALUES (5,'Ann');

CREATE TABLE Note_Type (
    Id   [INT]          NOT NULL,
    Name [VARCHAR] (50) NOT NULL,
    CONSTRAINT PK_Note_Type PRIMARY KEY (
        Id ASC
    ),
    CONSTRAINT IX_Note_Type UNIQUE (
        Name ASC
    )
);
INSERT INTO Note_Type VALUES (1,'Meeting');
INSERT INTO Note_Type VALUES (2,'Buylist');
INSERT INTO Note_Type VALUES (3,'Party');

CREATE TABLE Note (
    Id    [INT]          NOT NULL,
    Title [VARCHAR] (50) NOT NULL,
    Type  [INT]          NOT NULL,
    Text  [VARCHAR] (50) NOT NULL,
    CONSTRAINT PK_Note PRIMARY KEY (
        Id ASC
    ),
    FOREIGN KEY (
        Type
    )
    REFERENCES Note_Type (Id)
);
INSERT INTO Note VALUES (1,'Meeting with Ivan',1,'Meeting with Ivan to discuss  product');
INSERT INTO Note VALUES (2,'Buylist',2,'Items to buy in "ATB"');
INSERT INTO Note VALUES (3,'Lex''s birthday',3,'Lex''s birthday , dont forget to buy present');
INSERT INTO Note VALUES (4,'Farewell party',3,'Dont forget to buy products and set up environment');

CREATE TABLE Note_Product (
    Id         [INT] NOT NULL,
    Id_Note    [INT] NOT NULL,
    Id_Product [INT] NOT NULL,
    CONSTRAINT PK_Note_Product PRIMARY KEY (
        Id ASC
    ),
    FOREIGN KEY (
        Id_Note
    )
    REFERENCES Note (Id),
    FOREIGN KEY (
        Id_Product
    )
    REFERENCES Product (Id)
);
INSERT INTO Note_Product VALUES (1,3,5);
INSERT INTO Note_Product VALUES (2,4,4);
INSERT INTO Note_Product VALUES (3,4,3);
INSERT INTO Note_Product VALUES (4,4,2);
INSERT INTO Note_Product VALUES (5,4,1);
INSERT INTO Note_Product VALUES (6,2,3);
INSERT INTO Note_Product VALUES (7,2,2);
INSERT INTO Note_Product VALUES (8,2,1);
INSERT INTO Note_Product VALUES (9,2,5);

CREATE TABLE Note_Person (
    Id        [INT] NOT NULL,
    Id_Note   [INT] NOT NULL,
    Id_Person [INT] NOT NULL,
    CONSTRAINT PK_Note_Person PRIMARY KEY (
        Id ASC
    ),
    FOREIGN KEY (
        Id_Note
    )
    REFERENCES Note (Id),
    FOREIGN KEY (
        Id_Person
    )
    REFERENCES Person (Id)
);
INSERT INTO Note_Person VALUES (1,3,2);
INSERT INTO Note_Person VALUES (2,4,1);
INSERT INTO Note_Person VALUES (3,4,3);
INSERT INTO Note_Person VALUES (4,4,4);
INSERT INTO Note_Person VALUES (5,4,5);
INSERT INTO Note_Person VALUES (6,1,1);


CREATE T
RIGGER UpdateCounter AFTER UPDATE ON Note
begin
update UpdateStat set UpdateCount = ((select UpdateStat.UpdateCount From UpdateStat)+1);
end;

CREATE VIEW Stat AS

SELECT personName.Id_Person, personName.Id_Product,personName.Name as PersonName, product.Name as productName FROM

(SELECT person_product.Id_Person, person_product.Id_Product, person.Name FROM

(SELECT p.Id_Person, pr.I
 d_Product FROM [Note_Person] as p
JOIN Note_Product as pr
ON p.Id_Note = pr.Id_Note) as person_product

JOIN Person as person
ON person_product.Id_Person = person.Id) as personName

JOIN Product as product
ON product.Id = personName.Id_Product;
"""
    
    
//    associatedtype T
//
//    func GetAll() -> [T]
//    func Create()
//    func Update(_: T)
//    func Delete(_: T)
    static var db: OpaquePointer?

    static func openDatabase(DbPath:String) -> OpaquePointer? {
        var db: OpaquePointer? = nil
        
        var state = sqlite3_open(DbPath, &db)
        if state == SQLITE_OK {
            print("Successfully opened connection to database at \(DbPath)")
            return db
        } else {
            print("Error creation db connection")
            return nil
        }
    }
    
    static func executeSqlQuery(query:String, db:OpaquePointer?) {
        // 1
        var queryStatement: OpaquePointer? = nil
        // 2
        if sqlite3_prepare_v2(db, query, -1, &queryStatement, nil) == SQLITE_OK {
            // 3
            if sqlite3_step(queryStatement) == SQLITE_DONE {
                print("Query executed.")
            } else {
                print("Query executing error.")
            }
        } else {
            print("queryStatement could not be prepared.")
        }
        // 4
        sqlite3_finalize(queryStatement)
    }
    
    static func insert(query:String, db:OpaquePointer?) {
        var insertStatement: OpaquePointer? = nil
        
        // 1
        if sqlite3_prepare_v2(db, query, -1, &insertStatement, nil) == SQLITE_OK {
            let id: Int32 = 1
            let name: NSString = "Ray"
            
            // 2
            sqlite3_bind_int(insertStatement, 1, id)
            // 3
            sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)
            
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
    }
    
    static func querySelect(queryStatementString:String, db:OpaquePointer?) {
        var queryStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // 2
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                // 3
                let id = sqlite3_column_int(queryStatement, 0)
                
                // 4
                let queryResultCol1 = sqlite3_column_text(queryStatement, 1)
                let name = String(cString: queryResultCol1!)
                
                // 5
                print("Query Result:")
                print("\(id) | \(name)")
                
            } else {
                print("Query returned no results")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        // 6
        sqlite3_finalize(queryStatement)
    }
    
    static func initializeDb(DbPath:String) -> OpaquePointer? {
        let db = Repository.openDatabase(DbPath: DbPath)
        for s in Repository.initsValues {
            executeSqlQuery(query: s, db: db)
        }
        //executeSqlQuery(query: Repository.dbInitializationScript, db: db)
        Repository.db = db
        return db
    }
    
    static let noteRepository = NoteRepository()
}

