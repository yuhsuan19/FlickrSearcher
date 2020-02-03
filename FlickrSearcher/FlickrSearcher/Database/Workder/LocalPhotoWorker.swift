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
    var allLocalPhotoIds: [String] = []
    
    func newLocalPhoto(flickrId: String, title: String, imageData: Data) {
        var newLocalPhoto = LocalPhotoModel()
        newLocalPhoto.flickrId = flickrId
        newLocalPhoto.title = title
        newLocalPhoto.imageData = imageData
        newLocalPhoto.saved()
        
        allLocalPhotoIds.append(flickrId)
    }
    
    func deleteLocalPhoto(flickrID: String) {
        let query = QueryBuilder
            .select(SelectResult.expression(Meta.id))
            .from(DataSource.database(CouchbaseDBManager.shared.database))
            .where(Expression.property("flickrId")
                .equalTo(Expression.string(flickrID)))
        
        do {
            for result in try query.execute() {
                if let metaId = result.toDictionary()["id"] as? String,
                   let localPhoto = LocalPhotoModel(with: metaId) {
                    let flickrId = localPhoto.flickrId
                    
                    if let index =  allLocalPhotoIds.firstIndex(of: flickrId) {
                        allLocalPhotoIds.remove(at: index)
                    }
                    localPhoto.deleted()
                } else {
                    print("on")
                }
            }
        } catch {
            fatalError("Error fetching local photos")
        }
    }
    
    func fetchAllLocalPhotos() -> [[String: Any]] {
        allLocalPhotoIds.removeAll()
        
        let query = QueryBuilder
            .select(SelectResult.property("title"),
                    SelectResult.property("flickrId"),
                    SelectResult.property("image"))
            .from(DataSource.database(CouchbaseDBManager.shared.database))
            .where(Expression.property("type")
                .equalTo(Expression.string(LocalPhotoModel.type)))
        
        do {
            var output: [[String: Any]] = []
            for result in try query.execute() {
                if let title = result.string(forKey: "title"),
                   let flickrId = result.string(forKey: "flickrId"),
                   let imageData = result.blob(forKey: "image")?.content {
                    output.append([
                        "title": title,
                        "flickrId": flickrId,
                        "imageData": imageData
                    ])
                    allLocalPhotoIds.append(flickrId)
                }
            }
            return output
        } catch {
            fatalError("Error fetching local photos")
        }
    }
}
