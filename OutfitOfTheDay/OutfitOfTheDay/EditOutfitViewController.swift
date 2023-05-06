//
//  EditOutfitViewController.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/4/23.
//

//import UIKit
//
//class EditOutfitViewController: UIViewController {
//
//    var headImageView = UIImageView()
//    var topImageView = UIImageView()
//    var bottomImageView = UIImageView()
//    var shoesImageView = UIImageView()
//    
//    let deleteButton = UIButton()
//    let nameLabel = UILabel()
//    
//    let itemPadding: CGFloat = 10 * 1.5
//    let sectionPadding: CGFloat = 5
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .white
//        
//        
//        headImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(headImageView)
//        
//        topImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(topImageView)
//        
//        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(bottomImageView)
//        
//        shoesImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(shoesImageView)
//        
//        
//        
//        
//        deleteButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(deleteButton)
//        deleteButton.setTitle("  Delete Outfit  ", for: .normal)
//        deleteButton.setTitleColor(.black, for: .normal)
//        deleteButton.titleLabel?.font = .systemFont(ofSize: 25)
//        deleteButton.layer.cornerRadius = 15
//        deleteButton.layer.borderWidth = 3
//        deleteButton.layer.borderColor = UIColor.black.cgColor
//        deleteButton.backgroundColor = UIColor.systemTeal
//        deleteButton.addTarget(self, action: #selector(clickDelete), for: .touchUpInside)
//        
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(nameLabel)
//        nameLabel.text = ""
//        nameLabel.textColor = .black
//        nameLabel.font = .systemFont(ofSize: 25)
//        
//        setupConstraints()
//    }
//    
//    func setupConstraints() {
//        let viewPadding: CGFloat = 12
//        let padding: CGFloat = 50
//        let height: CGFloat = 100
//        let width: CGFloat = 169
//
//        NSLayoutConstraint.activate([
//            headImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: viewPadding),
//            headImageView.heightAnchor.constraint(equalToConstant: height),
//            headImageView.widthAnchor.constraint(equalToConstant: width),
//            headImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//            topImageView.topAnchor.constraint(equalTo: headImageView.bottomAnchor, constant: padding / 2),
//            topImageView.heightAnchor.constraint(equalToConstant: height),
//            topImageView.widthAnchor.constraint(equalToConstant: width),
//            topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            bottomImageView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: padding / 2),
//            bottomImageView.heightAnchor.constraint(equalToConstant: height),
//            bottomImageView.widthAnchor.constraint(equalToConstant: width),
//            bottomImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bottomImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            shoesImageView.topAnchor.constraint(equalTo: bottomImageView.bottomAnchor, constant: padding / 2),
//            shoesImageView.heightAnchor.constraint(equalToConstant: height),
//            shoesImageView.widthAnchor.constraint(equalToConstant: width),
//            shoesImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nameLabel.topAnchor.constraint(equalTo: shoesImageView.bottomAnchor, constant: padding)
//        ])
//        
//        NSLayoutConstraint.activate([
//            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            deleteButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding)
//        ])
//    }
//    
//    @objc func clickDelete(sender: UIButton) {
//        
////        IMPLEMENT DELETING FUNCTION
//        
//        NetworkManager.shared.deleteOutfit(name: nameLabel.text!) { response in
//            print("SUCCESS")
//            DispatchQueue.main.async {
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
//    }
//    
//}
