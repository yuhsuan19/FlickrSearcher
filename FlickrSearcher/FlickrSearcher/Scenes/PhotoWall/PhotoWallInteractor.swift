//
//  PhotoWallInteractor.swift
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

protocol PhotoWallBusinessLogic {
}

protocol PhotoWallDataStore {
}

class PhotoWallInteractor: PhotoWallBusinessLogic, PhotoWallDataStore {
    var presenter: PhotoWallPresentationLogic?
  
    // MARK: Do something
}