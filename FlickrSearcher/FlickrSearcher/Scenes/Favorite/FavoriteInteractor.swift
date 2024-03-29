//
//  FavoriteInteractor.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/3.
//  Copyright (c) 2020 CHI. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FavoriteBusinessLogic {
    func fetechLocalPhotos(request: Favorite.FetchLocalPhoto.Request)
    
    func uncollectPhoto(request: Favorite.UncollectPhoto.Request)
}

protocol FavoriteDataStore {
}

class FavoriteInteractor: FavoriteBusinessLogic, FavoriteDataStore {
    var presenter: FavoritePresentationLogic?
    var worker = LocalPhotoWorker.shared
    
    func fetechLocalPhotos(request: Favorite.FetchLocalPhoto.Request) {
        var response = Favorite.FetchLocalPhoto.Response()
        response.photos = worker.fetchAllLocalPhotos()
        presenter?.presentFetchLocalPhotos(response: response)
    }
    
    func uncollectPhoto(request: Favorite.UncollectPhoto.Request) {
        worker.deleteLocalPhoto(flickrID: request.flickrId)
        
        let response = Favorite.UncollectPhoto.Response()
        presenter?.presentUncollectPhoto(response: response)
    }
}
