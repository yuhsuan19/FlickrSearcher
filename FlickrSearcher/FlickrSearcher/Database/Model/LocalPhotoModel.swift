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
    var document: MutableDocument
    
    init() {
        document = MutableDocument()
        document.setString(LocalPhotoModel.type, forKey: "type")
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
            try CouchbaseDBManager.shared.database.saveDocument(document)
        } catch {
            fatalError("Error saving document")
        }
    }
}
