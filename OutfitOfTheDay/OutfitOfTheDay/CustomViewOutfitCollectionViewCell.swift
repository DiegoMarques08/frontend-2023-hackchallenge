//
//  CustomViewOutfitCollectionViewCell.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/2/23.
//

import UIKit

class CustomViewOutfitCollectionViewCell: UICollectionViewCell {
    var headImageView = UIImageView()
    var topImageView = UIImageView()
    var bottomImageView = UIImageView()
    var shoesImageView = UIImageView()
    var nameLabel = UILabel()
    
    var imageStackView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headImageView.layer.cornerRadius = 5
        headImageView.clipsToBounds = true
        headImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.layer.cornerRadius = 5
        topImageView.clipsToBounds = true
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomImageView.layer.cornerRadius = 5
        bottomImageView.clipsToBounds = true
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        
        shoesImageView.layer.cornerRadius = 5
        shoesImageView.clipsToBounds = true
        shoesImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = .systemFont(ofSize: 25)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageStackView.addSubview(headImageView)
        imageStackView.addSubview(topImageView)
        imageStackView.layer.borderWidth = 1
        imageStackView.layer.borderColor = UIColor.black.cgColor
        imageStackView.addSubview(bottomImageView)
        imageStackView.addSubview(shoesImageView)
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageStackView)
        imageStackView.backgroundColor = .gray
        imageStackView.addSubview(nameLabel)
        
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let padding: CGFloat = 5
        let width: CGFloat = 225
        
        let height = contentView.frame.height / 4 - 20
        
        NSLayoutConstraint.activate([
            imageStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageStackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            headImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headImageView.widthAnchor.constraint(equalToConstant: width),
            headImageView.heightAnchor.constraint(equalToConstant: height)
        ])
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: headImageView.bottomAnchor, constant: padding),
            topImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            topImageView.widthAnchor.constraint(equalToConstant: width),
            topImageView.heightAnchor.constraint(equalToConstant: height)
        ])
        
        NSLayoutConstraint.activate([
            bottomImageView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: padding),
            bottomImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomImageView.widthAnchor.constraint(equalToConstant: width),
            bottomImageView.heightAnchor.constraint(equalToConstant: height)
        ])
        
        NSLayoutConstraint.activate([
            shoesImageView.topAnchor.constraint(equalTo: bottomImageView.bottomAnchor, constant: padding),
            shoesImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shoesImageView.widthAnchor.constraint(equalToConstant: width),
            shoesImageView.heightAnchor.constraint(equalToConstant: height)
        ])
    
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: shoesImageView.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            nameLabel.bottomAnchor.constraint(equalTo: imageStackView.bottomAnchor)
        ])

    }
    
    func update(outfit: OutfitObjects) {
        
        if let imageData1 = try? Data(contentsOf: URL(string: outfit.headwear_id)!), let image1 = UIImage(data: imageData1) {
            headImageView.image = image1
        }
        else {
            print("The head image view cell didn't set up right")
        }
        
        if let imageData2 = try? Data(contentsOf: URL(string: outfit.top_id)!), let image2 = UIImage(data: imageData2) {
            topImageView.image = image2
        }
        else {
            print("The top image view cell didn't set up right")
        }
        
        if let imageData3 = try? Data(contentsOf: URL(string: outfit.bottom_id)!), let image3 = UIImage(data: imageData3) {
            bottomImageView.image = image3
        }
        else {
            print("The bottom image view cell didn't set up right")
        }
        
        if let imageData4 = try? Data(contentsOf: URL(string: outfit.shoes_id)!), let image4 = UIImage(data: imageData4) {
            shoesImageView.image = image4
        }
        else {
            print("The shoe image view cell didn't set up right")
        }
        
        nameLabel.text = outfit.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

