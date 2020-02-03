//
//  LocalPhotoWorker.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/3.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation
import CouchbaseLiteSwift

class LocalPhotoWorker {
    static let shared = LocalPhotoWorker()
    
    func newLocalPhoto(flickrID: String, title: String) {
        var newLocalPhoto = LocalPhotoModel()
        newLocalPhoto.flickrId = flickrID
        newLocalPhoto.title = title
        newLocalPhoto.saved()
    }
    
    func fetchAllLocalPhotos() {
        let query = QueryBuilder
            .select(SelectResult.all())
            .from(DataSource.database(CouchbaseDBManager.shared.database))
            .where(Expression.property("type")
                .equalTo(Expression.string("local_photo")))
        
        do {
            for result in try query.execute() {
                print(result.toDictionary())
            }
        } catch {
            print("error")
        }
    }
}
