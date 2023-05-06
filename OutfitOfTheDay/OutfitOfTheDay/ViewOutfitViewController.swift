//
//  ViewOutfitViewController.swift
//  OutFitOfTheDay
//
//  Created by Mya Bridgeforth on 4/28/23.
//

import UIKit

class ViewOutfitViewController: UIViewController {
    
    var viewOutfitCollectionView: UICollectionView!
    var outfitList: [Outfit] = []
    let imageView = UIImageView()
    let libraryLabel = UILabel()
    
    let itemPadding: CGFloat = 10
    let cellReuseId = "cellReuseId"
    let flowLayout = UICollectionViewFlowLayout()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
//        title = "Outfit Library"
        
        view.backgroundColor = .white
        
        flowLayout.minimumInteritemSpacing = itemPadding
        flowLayout.minimumLineSpacing = itemPadding
        flowLayout.scrollDirection = .vertical
        
        viewOutfitCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        viewOutfitCollectionView.translatesAutoresizingMaskIntoConstraints = false
        viewOutfitCollectionView.register(CustomViewOutfitCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseId)
        viewOutfitCollectionView.backgroundColor = .lightGray

        viewOutfitCollectionView.dataSource = self
        viewOutfitCollectionView.delegate = self
        view.addSubview(viewOutfitCollectionView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.image = UIImage(named: "profileIcon")
        
        libraryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(libraryLabel)
        libraryLabel.text = "Outfit Library"
        libraryLabel.font = .leagueGothic(size: 30)
        libraryLabel.textAlignment = .center
        libraryLabel.textColor = .black
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let padding: CGFloat = 50
        NSLayoutConstraint.activate([
            viewOutfitCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding * 1.5),
            viewOutfitCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            viewOutfitCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding / 2),
            viewOutfitCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding / 2)
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: libraryLabel.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding + 15)
        ])
        
        NSLayoutConstraint.activate([
            libraryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            libraryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding - 30),
            libraryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            libraryLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
    }


}

extension ViewOutfitViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NetworkManager.shared.outfitsShared.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let height = view.frame.height
        
        return CGSize(width: width, height: height * 0.75)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as? CustomViewOutfitCollectionViewCell {
            let x = NetworkManager.shared.outfitsShared[indexPath.item]
            cell.update(outfit: x)
            cell.backgroundColor = .cyan
            return cell
        }
        return UICollectionViewCell()
    }
}
