//
//  FavoritePhotoModel.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/3.
//  Copyright © 2020 CHI. All rights reserved.
//

import Foundation
import CouchbaseLiteSwift

struct LocalPhotoModel {
    static let type = "local_photo"
    
    let database = CouchbaseDBManager.shared.database
    
    var document: MutableDocument
    
    init() {
        document = MutableDocument()
        document.setString(LocalPhotoModel.type, forKey: "type")
    }
    
    init?(with id: String) {
        guard let doc = database.document(withID: id) else {
            return nil
        }
        document = doc.toMutable()
    }
    
    var flickrId: String {
        get {
            return document.string(forKey: "flickrId") ?? ""
        }
        
        set {
            document.setString(newValue, forKey: "flickrId")
        }
    }
    
    var title: String {
        get {
            return document.string(forKey: "title") ?? ""
        }
        
        set {
            document.setString(newValue, forKey: "title")
        }
    }
    
    var imageData: Data? {
        get {
            if let blob = document.blob(forKey: "image") {
                return blob.content
            } else {
                return nil
            }
        }
        set {
            guard let data = newValue else {
                return
            }
            let blob = Blob(contentType: "image/jpeg", data: data)
            document.setBlob(blob, forKey: "image")
        }
    }
    
    func saved() {
        do {
            try database.saveDocument(document)
        } catch {
            fatalError("Error saving document")
        }
    }
    
    func deleted() {
        do {
            try database.deleteDocument(document)
        } catch {
            fatalError("Error deleting document")
        }
    }
}
