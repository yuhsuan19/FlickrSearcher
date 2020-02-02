//
//  PhotoWallCollectionView.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/30.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit
// import Kingfisher

class PhotoWallCollectionView<Photo>: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var photos: [Photo] = []
    
    // MARK: Object life cycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let size = CGFloat((UIScreen.main.bounds.width / 2) - 3)
        layout.itemSize = CGSize(width: size, height: size * 1.2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5.0
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        register(PhotoWallCollectionViewCell.self, forCellWithReuseIdentifier: PhotoWallCollectionViewCell.reuseIdentifier)
        backgroundColor = .systemBackground
        dataSource = self
        delegate = self
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoWallCollectionViewCell.reuseIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
}
