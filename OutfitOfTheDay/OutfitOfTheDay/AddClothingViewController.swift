//
//  AddClothingViewController.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 4/28/23.
//

import UIKit

class AddClothingViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let takePhotoButton = UIButton()
    let photoLibraryButton = UIButton()
    let submitButton = UIButton()
    var invalidLabel = UILabel()
    
    var filterCollectionView: UICollectionView!
    let filterList = ["headwear", "top", "bottom", "shoes"]
    var clickedFilterList = [false, false, false, false]
    let sectionPadding: CGFloat = 5
    let itemPadding: CGFloat = 5
    let flowLayout = UICollectionViewFlowLayout()
    let filterReuseID = "filterReuseID"
    var currentFilter: Int = -1
    
    var imageView: UIImageView = UIImageView()
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    
        view.backgroundColor = .white
        
        
        takePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(takePhotoButton)
        takePhotoButton.setTitle("  Add Photo  ", for: .normal)
        takePhotoButton.setTitleColor(.black, for: .normal)
        takePhotoButton.titleLabel?.font = .systemFont(ofSize: 25)
        takePhotoButton.layer.cornerRadius = 15
        takePhotoButton.layer.borderWidth = 3
        takePhotoButton.layer.borderColor = UIColor.black.cgColor
        takePhotoButton.backgroundColor = UIColor.white
        takePhotoButton.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        submitButton.setTitle("  Save Photo  ", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.titleLabel?.font = .systemFont(ofSize: 25)
        submitButton.layer.cornerRadius = 15
        submitButton.layer.borderWidth = 3
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.backgroundColor = UIColor.white
        submitButton.addTarget(self, action: #selector(saveClothing), for: .touchUpInside)
        
        invalidLabel.textColor = .black
        invalidLabel.font = .systemFont(ofSize: 25)
        view.addSubview(invalidLabel)
        invalidLabel.translatesAutoresizingMaskIntoConstraints = false
        invalidLabel.textAlignment = .center
        
        flowLayout.minimumInteritemSpacing = itemPadding
        flowLayout.minimumLineSpacing = itemPadding
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: sectionPadding, left: sectionPadding, bottom: sectionPadding, right: sectionPadding)
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        filterCollectionView.register(CustomFilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseID)
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterCollectionView)
        
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        invalidLabel.textColor = .black
        invalidLabel.font = .systemFont(ofSize: 25)
        view.addSubview(invalidLabel)
        invalidLabel.translatesAutoresizingMaskIntoConstraints = false
        invalidLabel.textAlignment = .center
        invalidLabel.backgroundColor = .white
        invalidLabel.text = ""
        invalidLabel.lineBreakMode = .byCharWrapping
        
        
        setUpConstraints()
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
            self.imagePicker.present(from: sender)
        }
    
    func setUpConstraints() {
        let padding: CGFloat = 50
        NSLayoutConstraint.activate([
            takePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            takePhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: takePhotoButton.bottomAnchor, constant: padding * 2 - 15)
        ])
        
        let collectionViewPadding: CGFloat = 10
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding / 2),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding / 2),
            imageView.heightAnchor.constraint(equalToConstant: padding * 7),
            imageView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: padding),
        ])
        
        NSLayoutConstraint.activate([
            invalidLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            invalidLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: padding / 2),
            invalidLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding / 2),
            invalidLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding / 2)
        ])
    }

}

extension AddClothingViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        if let image = image {
            imageView.image = image
            takePhotoButton.backgroundColor = .black
            takePhotoButton.setTitleColor(.white, for: .normal)
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.black.cgColor
        }
    }
}





extension AddClothingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterReuseID, for: indexPath) as? CustomFilterCollectionViewCell {
                let index: Int = indexPath.item
                cell.configure(index: index, selectedList: clickedFilterList, filterName: filterList[index])
                return cell
            }
        return UICollectionViewCell()
    }
    
}

extension AddClothingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(view.frame.width / 4.5), height: 63)
    }
    
}


extension AddClothingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterReuseID, for: indexPath) as? CustomFilterCollectionViewCell {
                
                clickedFilterList = clickedFilterList.map { _ in false }
                clickedFilterList[indexPath.item].toggle()
                currentFilter = indexPath.item
                cell.update(selectedList: clickedFilterList)
                cell.reloadInputViews()
            }

            self.filterCollectionView.reloadData()
    }
    
    @objc func saveClothing() {
        
        if !(clickedFilterList.contains(true)) {
            invalidLabel.text = "Please select a filter"
        }
        else if imageView.image == nil {
            invalidLabel.text = "Please add a photo"
        }
        else {
            invalidLabel.text = ""
            print("Ready to go!")
            
            let imageData = (imageView.image)!.pngData() as NSData?
            let strBase64 = imageData?.base64EncodedString(options: .lineLength64Characters)

            NetworkManager.shared.uploadClothing(type: filterList[currentFilter], userName: NetworkManager.shared.userName, imageData: ("data:image/png;base64," + strBase64!)) { response in
                
                print("SUCCESS")
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
