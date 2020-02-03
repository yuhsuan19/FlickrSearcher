//
//  PhotoWallCollectionViewCell.swift
//  FlickrSearcher
//
//  Created by CHI on 2020/1/30.
//  Copyright © 2020 CHI. All rights reserved.
//

import UIKit

protocol PhotoWallCollectionViewCellDelegate: class {
    func functionalButtonDidTapped(in cell: PhotoWallCollectionViewCell)
}

class PhotoWallCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoWallCollectionViewCell"
    
    weak var cellDelegate: PhotoWallCollectionViewCellDelegate?
    
    // MARK: User interface elements
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var functionalImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var functionalButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(functionalButtonDidTapped), for: .touchUpInside)
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
        
        contentView.addSubview(functionalImageView)
        functionalImageView.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.2).isActive = true
        functionalImageView.heightAnchor.constraint(equalTo: functionalImageView.widthAnchor).isActive = true
        functionalImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8).isActive = true
        functionalImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8).isActive = true
        
        contentView.addSubview(functionalButton)
        functionalButton.heightAnchor.constraint(equalTo: functionalImageView.heightAnchor).isActive = true
        functionalButton.widthAnchor.constraint(equalTo: functionalImageView.widthAnchor).isActive = true
        functionalButton.centerXAnchor.constraint(equalTo: functionalImageView.centerXAnchor).isActive = true
        functionalButton.centerYAnchor.constraint(equalTo: functionalImageView.centerYAnchor).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func turnOnFavorite() {
        functionalImageView.image = UIImage(named: "favorite_on")
    }
    
    func turnOffFavorite() {
        functionalImageView.image = UIImage(named: "favorite_off")
    }
    
    // MARK: User interaction event
    @objc func functionalButtonDidTapped() {
        cellDelegate?.functionalButtonDidTapped(in: self)
    }
}
