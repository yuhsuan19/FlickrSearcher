//
//  SearchResultCollectionView.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/2.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultCollectionView: PhotoWallCollectionView<SearchResult.FlickrPhoto> {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! PhotoWallCollectionViewCell
        let flickrPhoto = photos[indexPath.row]
        cell.titleLabel.text = flickrPhoto.title
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
    }
}
