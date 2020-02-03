//
//  PhotoWallCollectionViewCell.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/30.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit

protocol PhotoWallCollectionViewCellDelegate: class {
    func favoriteButtonDidTapped(in cell: PhotoWallCollectionViewCell)
}

class PhotoWallCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoWallCollectionViewCell"
    
    weak var cellDelegate: PhotoWallCollectionViewCellDelegate?
    
    // MARK: User interface elements
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var favoriteImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(favoriteButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: Object life cycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpAndLayoutViews()
    }
    
    private func setUpAndLayoutViews() {
        contentView.addSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        contentView.addSubview(favoriteImageView)
        favoriteImageView.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.2).isActive = true
        favoriteImageView.heightAnchor.constraint(equalTo: favoriteImageView.widthAnchor).isActive = true
        favoriteImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8).isActive = true
        favoriteImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8).isActive = true
        
        contentView.addSubview(favoriteButton)
        favoriteButton.heightAnchor.constraint(equalTo: favoriteImageView.heightAnchor).isActive = true
        favoriteButton.widthAnchor.constraint(equalTo: favoriteImageView.widthAnchor).isActive = true
        favoriteButton.centerXAnchor.constraint(equalTo: favoriteImageView.centerXAnchor).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: favoriteImageView.centerYAnchor).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func turnOnFavorite() {
        favoriteImageView.image = UIImage(named: "favorite_on")
    }
    
    func turnOffFavorite() {
        favoriteImageView.image = UIImage(named: "favorite_off")
    }
    
    // MARK: User interaction event
    @objc func favoriteButtonDidTapped() {
        cellDelegate?.favoriteButtonDidTapped(in: self)
    }
}
