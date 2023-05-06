//
//  CustomFilterCollectionViewCell.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/3/23.
//

import UIKit

class CustomFilterCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        contentView.addSubview(label)
        contentView.backgroundColor = .systemGray
        
        setUpConstraints()
    }
    
    func configure(index: Int, selectedList: [Bool], filterName: String) {
        label.text = filterName
        
        if(selectedList[index]) {
            label.backgroundColor = .black
            label.textColor = .white
        }
        else {
            label.backgroundColor = .white
            label.layer.borderWidth = 3
            label.layer.borderColor = UIColor.black.cgColor
            label.textColor = .black
        }
    }
    
    func update(selectedList: [Bool]) {
        for i in 0..<4 {
            if(selectedList[i]) {
                label.backgroundColor = .red
            }
            else {
                label.backgroundColor = .systemGray
            }
        }
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func changeBackground() {
        label.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
