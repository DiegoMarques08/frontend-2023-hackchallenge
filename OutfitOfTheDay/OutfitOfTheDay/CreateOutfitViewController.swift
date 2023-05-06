//
//  CreateOutfitViewController.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 4/28/23.
//

import UIKit


class CreateOutfitViewController: UIViewController, UICollectionViewDelegate {
    
    var headCollectionView: UICollectionView!
    var topCollectionView: UICollectionView!
    var bottomCollectionView: UICollectionView!
    var shoesCollectionView: UICollectionView!
    let saveButton = UIButton()
    let nameTextField = UITextField()
    
    let headLabel = UILabel()
    let topLabel = UILabel()
    let bottomLabel = UILabel()
    let shoesLabel = UILabel()
    
    private var head: [String] = []
    private var top: [String] = []
    private var bottom: [String] = []
    private var shoes: [String] = []
    
    let itemPadding: CGFloat = 10 * 1.5
    let sectionPadding: CGFloat = 5
    
    let headCellReuseID = "headCellReuseID"
    let topCellReuseID = "topCellReuseID"
    let bottomCellReuseID = "bottomCellReuseID"
    let shoesCellReuseID = "shoesCellReuseID"
    
    let headFlowLayout = UICollectionViewFlowLayout()
    let topFlowLayout = UICollectionViewFlowLayout()
    let bottomFlowLayout = UICollectionViewFlowLayout()
    let shoesFlowLayout = UICollectionViewFlowLayout()
    
    let width: CGFloat = 169
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        head = NetworkManager.shared.headShared
        top = NetworkManager.shared.topShared
        bottom = NetworkManager.shared.bottomShared
        shoes = NetworkManager.shared.shoesShared
        
    
        view.backgroundColor = .white

        headFlowLayout.minimumInteritemSpacing = itemPadding
        headFlowLayout.minimumLineSpacing = itemPadding
        headFlowLayout.scrollDirection = .horizontal
        
        topFlowLayout.minimumInteritemSpacing = itemPadding
        topFlowLayout.minimumLineSpacing = itemPadding
        topFlowLayout.scrollDirection = .horizontal
        
        bottomFlowLayout.minimumInteritemSpacing = itemPadding
        bottomFlowLayout.minimumLineSpacing = itemPadding
        bottomFlowLayout.scrollDirection = .horizontal
        
        shoesFlowLayout.minimumInteritemSpacing = itemPadding
        shoesFlowLayout.minimumLineSpacing = itemPadding
        shoesFlowLayout.scrollDirection = .horizontal
        
        
        headCollectionView = UICollectionView(frame: .zero, collectionViewLayout: headFlowLayout)
        headCollectionView.translatesAutoresizingMaskIntoConstraints = false
        headCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: headCellReuseID)
        headCollectionView.dataSource = self
        headCollectionView.delegate = self
        headCollectionView.backgroundColor = .lightGray
        view.addSubview(headCollectionView)
        
        topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: topFlowLayout)
        topCollectionView.translatesAutoresizingMaskIntoConstraints = false
        topCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: topCellReuseID)
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        topCollectionView.backgroundColor = .lightGray
        view.addSubview(topCollectionView)
        
        bottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: bottomFlowLayout)
        bottomCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bottomCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: bottomCellReuseID)
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.backgroundColor = .lightGray
        view.addSubview(bottomCollectionView)
        
        shoesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: shoesFlowLayout)
        shoesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        shoesCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: shoesCellReuseID)
        shoesCollectionView.dataSource = self
        shoesCollectionView.delegate = self
        shoesCollectionView.backgroundColor = .lightGray
        view.addSubview(shoesCollectionView)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        saveButton.setTitle("  Save Outfit  ", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 20)
        saveButton.layer.borderWidth = 2
        saveButton.layer.borderColor = UIColor.black.cgColor
        saveButton.backgroundColor = UIColor.white
        saveButton.addTarget(self, action: #selector(clickSave), for: .touchUpInside)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        nameTextField.placeholder = "Name your outfit!"
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = .white
        nameTextField.textColor = .black
        nameTextField.borderStyle = .bezel
        nameTextField.font = .systemFont(ofSize: 25)
        
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headLabel)
        headLabel.text = "Headwear"
        headLabel.textColor = .black
        headLabel.font = .systemFont(ofSize: 20)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topLabel)
        topLabel.text = "Top"
        topLabel.textColor = .black
        topLabel.font = .systemFont(ofSize: 20)
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomLabel)
        bottomLabel.text = "Bottom"
        bottomLabel.textColor = .black
        bottomLabel.font = .systemFont(ofSize: 20)
        
        shoesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shoesLabel)
        shoesLabel.text = "Shoes"
        shoesLabel.textColor = .black
        shoesLabel.font = .systemFont(ofSize: 20)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        let padding: CGFloat = 50
        let height: CGFloat = 100

        NSLayoutConstraint.activate([
            headCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            headCollectionView.heightAnchor.constraint(equalToConstant: height),
            headCollectionView.widthAnchor.constraint(equalToConstant: width),
            headCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topCollectionView.topAnchor.constraint(equalTo: headCollectionView.bottomAnchor, constant: padding / 2),
            topCollectionView.heightAnchor.constraint(equalToConstant: height),
            topCollectionView.widthAnchor.constraint(equalToConstant: width),
            topCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            bottomCollectionView.topAnchor.constraint(equalTo: topCollectionView.bottomAnchor, constant: padding / 2),
            bottomCollectionView.heightAnchor.constraint(equalToConstant: height),
            bottomCollectionView.widthAnchor.constraint(equalToConstant: width),
            bottomCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            shoesCollectionView.topAnchor.constraint(equalTo: bottomCollectionView.bottomAnchor, constant: padding / 2),
            shoesCollectionView.heightAnchor.constraint(equalToConstant: height),
            shoesCollectionView.widthAnchor.constraint(equalToConstant: width),
            shoesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: shoesCollectionView.bottomAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: padding * 1.7),
            saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            headLabel.trailingAnchor.constraint(equalTo: headCollectionView.leadingAnchor, constant: -padding / 4),
            headLabel.centerYAnchor.constraint(equalTo: headCollectionView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topLabel.centerXAnchor.constraint(equalTo: headLabel.centerXAnchor),
            topLabel.centerYAnchor.constraint(equalTo: topCollectionView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: headLabel.centerXAnchor),
            bottomLabel.centerYAnchor.constraint(equalTo: bottomCollectionView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            shoesLabel.centerXAnchor.constraint(equalTo: headLabel.centerXAnchor),
            shoesLabel.centerYAnchor.constraint(equalTo: shoesCollectionView.centerYAnchor)
        ])
    }
    
    @objc func clickSave(sender: UIButton) {
        
        if let visibleIndexPath1: IndexPath = headCollectionView.indexPathsForVisibleItems.first {
            let headvisibleCellIndex = visibleIndexPath1.item
            
            if let visibleIndexPath2: IndexPath = topCollectionView.indexPathsForVisibleItems.first {
                let topvisibleCellIndex = visibleIndexPath2.item
                
                if let visibleIndexPath3: IndexPath = bottomCollectionView.indexPathsForVisibleItems.first {
                    let bottomvisibleCellIndex = visibleIndexPath3.item
                    
                    if let visibleIndexPath4: IndexPath = shoesCollectionView.indexPathsForVisibleItems.first {
                        let shoesvisibleCellIndex = visibleIndexPath4.item
                        
                        if !(nameTextField.text == "") {
                         
                            NetworkManager.shared.createOutfit(head: head[headvisibleCellIndex], top: top[topvisibleCellIndex], bottom: bottom[bottomvisibleCellIndex], shoes: shoes[shoesvisibleCellIndex], name: nameTextField.text!) {response in
                                DispatchQueue.main.async {
                                    self.navigationController?.popViewController(animated: true)
                                }
                                
                            }
                            
                        }
                        else {
                            print("Creating outfit failure")
                        }
                    }
                }
            }
        }
        else {
            print("Whoops")
        }
        navigationController?.popViewController(animated: true)
        
    }
    
}

extension CreateOutfitViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.headCollectionView  {
            print(head.count)
            return head.count
        }
        else if collectionView == self.topCollectionView {
            return top.count
        }
        else if collectionView == self.shoesCollectionView {
            return shoes.count
        }
        else if collectionView == self.bottomCollectionView {
            return bottom.count
        }
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print(collectionView == self.headCollectionView)
//        print(collectionView == self.topCollectionView)
//        print(collectionView == self.bottomCollectionView)
//        print(collectionView == self.shoesCollectionView)
        
        if collectionView == self.headCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headCellReuseID, for: indexPath) as? CustomCollectionViewCell {
                let stringName = head[indexPath.item]
                let urlName = URL(string: stringName)
                cell.update(imageName: urlName!)
                return cell
            }
        }
        
        else if collectionView == self.topCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellReuseID, for: indexPath) as? CustomCollectionViewCell {
                let stringName = top[indexPath.item]
                let urlName = URL(string: stringName)
                cell.update(imageName: urlName!)
                return cell
            }
        }
        else if collectionView == self.bottomCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCellReuseID, for: indexPath) as? CustomCollectionViewCell {
                let stringName = bottom[indexPath.item]
                let urlName = URL(string: stringName)
                cell.update(imageName: urlName!)
                return cell
            }
        }
        else if collectionView == self.shoesCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shoesCellReuseID, for: indexPath) as? CustomCollectionViewCell {
                let stringName = shoes[indexPath.item]
                let urlName = URL(string: stringName)
                cell.update(imageName: urlName!)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
    
extension CreateOutfitViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let len = (view.frame.width - 2 * itemPadding - sectionPadding - 30) / 2
        print(len)
        return CGSize(width: len, height: len)
    }
}
