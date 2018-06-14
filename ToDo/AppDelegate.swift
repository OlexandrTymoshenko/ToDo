//
//  AppDelegate.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/4/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import UIKit
import SQLite3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask, appropriateFor: nil, create:
        false).appendingPathComponent("newDb13111.db")
//
//        do{
//            try FileManager.default.removeItem(atPath: fileUrl.absoluteString)}
//        catch{}
//
//        fileUrl = try!
//            FileManager.default.url(for: .documentDirectory,
//                                    in: .userDomainMask, appropriateFor: nil, create:
//                false).appendingPathComponent("newsDb.db")
////        //connect to db
//        var db = Repository.openDatabase(DbPath: fileUrl.path)
////
//        let createTableString = """
//            CREATE TABLE Contact(
//            Id INT PRIMARY KEY NOT NULL,
//            Name CHAR(255));
//           """
//
////        //createTable
//        Repository.executeSqlQuery(query: createTableString, db: db)
////
////        //inser        let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
////        Repository.insert(query: insertStatementString, db: db)
//
//        //select
//        var queryStatementString = "SELECT * FROM Contact;"
//        Repository.querySelect(queryStatementString: queryStatementString, db: db)
//
//
//
//            queryStatementString = "SELECT * FROM Contact;"
//            var queryStatement: OpaquePointer? = nil
//            var st = sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil)
//            if st == SQLITE_OK {
//                var s = sqlite3_step(queryStatement)
//                while (s == SQLITE_ROW) {
//                    let id = sqlite3_column_int(queryStatement, 0)
//                    let queryResultCol1 = sqlite3_column_text(queryStatement, 1)
//                    let title = String(cString: queryResultCol1!)
//                    let type = sqlite3_column_int(queryStatement, 2)
//                    let queryResultCol3 = sqlite3_column_text(queryStatement, 3)
//                    let text = String(cString: queryResultCol3!)
//                    let noteType = NoteType(rawValue:Int(type))
//                    //notes.append(Note(Id: Int(id), Title: title, Text: text, NoteType: noteType! ))
//                }
//
//            } else {
//                print("SELECT statement could not be prepared")
//            }
//            sqlite3_finalize(queryStatement)
        
        
        
        
        Repository.initializeDb(DbPath: fileUrl.path)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

