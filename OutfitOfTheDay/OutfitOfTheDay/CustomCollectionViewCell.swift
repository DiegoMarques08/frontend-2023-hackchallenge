//
//  CustomCollectionViewCell.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/1/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func update(imageName: URL) {
        
//        https://tjv37-hack-challenge.s3.us-east-1.amazonaws.com/ISHW7R3DWX85H82P.png
        
        
        if let imageData = try? Data(contentsOf: imageName), let image = UIImage(data: imageData) {
            imageView.image = image
        }
        else {
            print("The image view cell didn't set up right")
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
