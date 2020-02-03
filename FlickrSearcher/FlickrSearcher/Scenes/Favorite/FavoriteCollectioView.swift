//
//  FavoriteCollectioView.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/3.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit

class FavoriteCollectioView: PhotoWallCollectionView<Favorite.Photo> {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! PhotoWallCollectionViewCell
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title
        cell.imageView.image = photo.image
        
        return cell
    }
}
