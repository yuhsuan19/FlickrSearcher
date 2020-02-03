//
//  FavoriteCollectioView.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/2/3.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit

protocol FavoriteCollectioViewDelegate: class {
    func deleteFavoritePhoto(with flickrId: String)
}

class FavoriteCollectioView: PhotoWallCollectionView<Favorite.Photo> {
    weak var localPhotoDelegate: FavoriteCollectioViewDelegate?
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! PhotoWallCollectionViewCell
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title
        cell.imageView.image = photo.image
        cell.functionalImageView.image = UIImage(named: "remove")
        
        cell.cellDelegate = self
        return cell
    }
}

extension FavoriteCollectioView: PhotoWallCollectionViewCellDelegate {
    func functionalButtonDidTapped(in cell: PhotoWallCollectionViewCell) {
        guard let indexPath = indexPath(for: cell) else {
            return
        }
        let flickrId = photos[indexPath.row].flickrId
        localPhotoDelegate?.deleteFavoritePhoto(with: flickrId)
    }
}
