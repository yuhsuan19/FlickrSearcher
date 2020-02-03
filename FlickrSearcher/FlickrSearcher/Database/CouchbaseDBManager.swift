//
//  Test.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/3.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation
import CouchbaseLiteSwift

class CouchbaseDBManager {
    static let shared = CouchbaseDBManager()
    
    static let appDatabaseName = "FlickrSearcherAppDataBase"
    
    let database: Database
    
    init() {
        do {
            database = try Database(name: CouchbaseDBManager.appDatabaseName)
        } catch {
            fatalError("Error init database")
        }
    }
}
