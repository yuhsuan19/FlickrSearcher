//
//  PhotoWallPresenter.swift
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

protocol SearchResultPresentationLogic {
    func presentLoadPhotos(response: SearchResult.LoadPhotos.Response)
}

class SearchResultPresenter: SearchResultPresentationLogic {
    weak var viewController: SearchResultDisplayLogic?
    func presentLoadPhotos(response: SearchResult.LoadPhotos.Response) {
        var viewModel = SearchResult.LoadPhotos.ViewModel()
        if let error = response.error {
            
        } else {
            var filckrPhotos:[SearchResult.FlickrPhoto] = []
            response.photos.forEach() {
                filckrPhotos.append(SearchResult.FlickrPhoto(json: $0))
            }
            viewModel.flickrPhotos = filckrPhotos
        }
        
        viewController?.displayLoadPhotos(viewModel: viewModel)
    }
}