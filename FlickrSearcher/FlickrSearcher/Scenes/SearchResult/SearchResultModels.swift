//
//  PhotoWallModels.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/26.
//  Copyright (c) 2020 CHI. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SwiftyJSON

enum SearchResult {
    // MARK: Use cases
    enum LoadPhotos {
        struct Request { }
        struct Response {
            var error: Error?
            var photos: [JSON] = []
            var isLoadingAll: Bool = false
        }
        struct ViewModel {
            var errorMessage: String?
            var flickrPhotos: [FlickrPhoto] = []
            var isLoadingAll: Bool = false
        }
    }
    
    enum CollectPhoto {
        struct Request {
            var imageData: Data
            var title: String
            var id: String
        }
        struct Response {}
        struct ViewModel {}
    }
    
    enum UncollectPhoto {
        struct Request {
            var flickrId: String
        }
        struct Response {}
        struct ViewModel {}
    }
    
    struct FlickrPhoto {
        let id: String
        let server: String
        let title: String
        let secret: String
        let owner: String
        let isPublic: Bool
        let isFriend: Bool
        let isFamily: Bool
        let farm: Int
        
        var imageUrl: URL? {
           return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")
        }
        
        init(json: JSON) {
            id = json["id"].stringValue
            server = json["server"].stringValue
            title = json["title"].stringValue
            secret = json["secret"].stringValue
            owner = json["owner"].stringValue
            isPublic = (json["ispublic"].intValue == 1)
            isFriend = (json["isfriend"].intValue == 1)
            isFamily = (json["isFamily"].intValue == 1)
            farm = json["farm"].intValue
        }
    }
}
