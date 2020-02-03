//
//  SearchResultCollectionView.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/2.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit
import Kingfisher

protocol SearchResultCollectionViewDelegate: class {
    func shouldLoadNextPage()
    func lastCellWillDisplay()
}

class SearchResultCollectionView: PhotoWallCollectionView<SearchResult.FlickrPhoto> {
    weak var flickrPhotoWallDelegate: SearchResultCollectionViewDelegate?
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! PhotoWallCollectionViewCell
        let flickrPhoto = photos[indexPath.row]
        cell.titleLabel.text = flickrPhoto.title
        cell.turnOffFavorite()
        cell.cellDelegate = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? PhotoWallCollectionViewCell,
            let imageURL = photos[indexPath.row].imageUrl else {
            return
        }
        let cacheKey = "\(imageURL).cache"
        let resource = ImageResource(downloadURL: imageURL, cacheKey: cacheKey)
        cell.imageView.kf.setImage(with: resource)
        
        if photos.count - indexPath.row <= 10 {
            flickrPhotoWallDelegate?.shouldLoadNextPage()
        }
        
        if indexPath.row == photos.count - 1 {
            flickrPhotoWallDelegate?.lastCellWillDisplay()
        }
    }
}

extension SearchResultCollectionView: PhotoWallCollectionViewCellDelegate {
    func favoriteButtonDidTapped(in cell: PhotoWallCollectionViewCell) {
        print(indexPath(for: cell))
    }
}
