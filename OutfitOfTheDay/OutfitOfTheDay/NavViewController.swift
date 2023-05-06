//
//  NavViewController.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 4/28/23.
//

import UIKit

class NavViewController: UIViewController {
    
    let userNameLabel = UILabel()
    let signOutButton = UIButton()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    let addClothingButton = UIButton()
    let createOutfitButton = UIButton()
    let viewOutfitsButton = UIButton()
    var usernameStored = ""
    
    public let filtersGeneral = ["filter1", "filter2", "filter3", "filter4", "filter5"]
    let  filtersGeneralReuseID = "filtersGeneralReuseID"
    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
            usernameStored = username
        NetworkManager.shared.userName = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        view.backgroundColor = .white
        title = "Main Menu"
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameLabel)
        userNameLabel.text = "Let's get dressed, " + usernameStored + "!"
        userNameLabel.font = .systemFont(ofSize: 20)
        userNameLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.text = "OOTD"
        titleLabel.font = .systemFont(ofSize: 80)
        titleLabel.textAlignment = .center
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.image = UIImage(named: "profileIcon")
        
        
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signOutButton)
        signOutButton.setTitle("  Sign Out  ", for: .normal)
        signOutButton.setTitleColor(.black, for: .normal)
        signOutButton.titleLabel?.font = .systemFont(ofSize: 25)
        signOutButton.layer.cornerRadius = 15
        signOutButton.layer.borderWidth = 3
        signOutButton.layer.borderColor = UIColor.black.cgColor
        signOutButton.backgroundColor = UIColor.white
        signOutButton.addTarget(self, action: #selector(clickSignOut), for: .touchUpInside)
        
        addClothingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addClothingButton)
        addClothingButton.setTitle("  + Add Clothing  ", for: .normal)
        addClothingButton.setTitleColor(.black, for: .normal)
        addClothingButton.titleLabel?.font = .systemFont(ofSize: 20)
        addClothingButton.layer.borderWidth = 2
        addClothingButton.layer.borderColor = UIColor.black.cgColor
        addClothingButton.backgroundColor = UIColor.white
        addClothingButton.addTarget(self, action: #selector(clickAddClothing), for: .touchUpInside)
        
        createOutfitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createOutfitButton)
        createOutfitButton.setTitle("  Create New Outfit  ", for: .normal)
        createOutfitButton.setTitleColor(.black, for: .normal)
        createOutfitButton.titleLabel?.font = .systemFont(ofSize: 20)
        createOutfitButton.layer.borderWidth = 2
        createOutfitButton.layer.borderColor = UIColor.black.cgColor
        createOutfitButton.backgroundColor = UIColor.white
        createOutfitButton.addTarget(self, action: #selector(clickCreateOutfit), for: .touchUpInside)
        
        viewOutfitsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewOutfitsButton)
        viewOutfitsButton.setTitle("  My Outfits  ", for: .normal)
        viewOutfitsButton.setTitleColor(.black, for: .normal)
        viewOutfitsButton.titleLabel?.font = .systemFont(ofSize: 25)
        viewOutfitsButton.layer.borderWidth = 0
        viewOutfitsButton.layer.borderColor = UIColor.black.cgColor
        viewOutfitsButton.backgroundColor = UIColor.white
        viewOutfitsButton.addTarget(self, action: #selector(clickViewOutfits), for: .touchUpInside)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let padding: CGFloat = 50
        
        NSLayoutConstraint.activate([
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding * 1.5),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding / 3),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding / 3)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: padding / 2),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding + 15)
        ])
        
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addClothingButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -padding / 2),
            addClothingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: padding * -2)
        ])
        
        NSLayoutConstraint.activate([
            createOutfitButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: padding / 2 - 20),
            createOutfitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: padding * -2)
        ])
        
        NSLayoutConstraint.activate([
            viewOutfitsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -padding * 2 - 20),
            viewOutfitsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    @objc func clickAddClothing(sender: UIButton) {
        self.navigationController?.pushViewController(AddClothingViewController(), animated: true)
    }
    
    @objc func clickCreateOutfit(sender: UIButton) {
        
        NetworkManager.shared.getAllPictures(userName: NetworkManager.shared.userName, type: "headwear") { response in
            
            NetworkManager.shared.getAllPictures(userName: NetworkManager.shared.userName, type: "top") { response in
                
                NetworkManager.shared.getAllPictures(userName: NetworkManager.shared.userName, type: "bottom") { response in
                    
                    NetworkManager.shared.getAllPictures(userName: NetworkManager.shared.userName, type: "shoes") { response in
                        
                        DispatchQueue.main.async {                self.navigationController?.pushViewController(CreateOutfitViewController(), animated: true)
                        }
                        
                    }
                    
                }
                
            }

            
        }
        
        
        
        
    }
    
    @objc func clickViewOutfits(sender: UIButton) {
        NetworkManager.shared.viewOutfits(username: NetworkManager.shared.userName) { response in
            
            print("*********")
            print(response)
            print("*********")
            print(response.outfits)
            print("*********")
            
            DispatchQueue.main.async {
                NetworkManager.shared.outfitsShared = response.outfits
                
                self.navigationController?.pushViewController(ViewOutfitViewController(), animated: true)
            }
        }
        
    }
    
    @objc func clickSignOut(sender: UIButton) {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
}

