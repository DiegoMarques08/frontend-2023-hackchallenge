//
//  SignUpViewController.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 4/28/23.
//

import UIKit

class SignUpViewController: UIViewController {

    let titleLabel = UILabel()
    let createLabel = UILabel()
    let submitButton = UIButton()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    var invalidLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        view.backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.text = "Welcome to OotD!"
        titleLabel.font = .leagueGothic(size: 45)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createLabel)
        createLabel.text = "Create your account"
        createLabel.font = .leagueGothic(size: 30)
        createLabel.textAlignment = .center
        createLabel.textColor = .black
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        usernameTextField.placeholder = "Insert Username"
        usernameTextField.backgroundColor = .white
        usernameTextField.textColor = .black
        usernameTextField.borderStyle = .bezel
        usernameTextField.font = .systemFont(ofSize: 25)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        passwordTextField.placeholder = "Insert Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.borderStyle = .bezel
        passwordTextField.font = .systemFont(ofSize: 25)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        submitButton.setTitle("  Create  ", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = .leagueGothic(size: 25)
        submitButton.layer.cornerRadius = 15
        submitButton.layer.borderWidth = 3
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.backgroundColor = .black
        submitButton.addTarget(self, action: #selector(clickSubmit), for: .touchUpInside)
        
        invalidLabel.textColor = .black
        invalidLabel.font = .systemFont(ofSize: 25)
        view.addSubview(invalidLabel)
        invalidLabel.translatesAutoresizingMaskIntoConstraints = false
        invalidLabel.textAlignment = .center
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let padding: CGFloat = 50
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            createLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            createLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            createLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        
        
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(padding * 2)),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -padding)
            
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -padding)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.centerYAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: padding * 3),
            submitButton.widthAnchor.constraint(equalToConstant: 175)
        ])
        
        NSLayoutConstraint.activate([
            invalidLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            invalidLabel.centerYAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: padding * 1.2),
            invalidLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding / 2),
            invalidLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding / 2)
        ])
    }
    
    @objc func clickSubmit(sender: UIButton) {
        invalidLabel.text = ""
        if let x = usernameTextField.text {
            if  x == "" {
                invalidLabel.text = "Please enter a username"
            }
            else if x.count > 10 {
                invalidLabel.numberOfLines = 2
                invalidLabel.text = "Maximum username length is 10 characters"
                usernameTextField.text = ""
            }
            else if let y = passwordTextField.text {
                if y == "" {
                    invalidLabel.text = "Please enter a password"
                    }
                else {
                    NetworkManager.shared.signUp(username: usernameTextField.text!, password: passwordTextField.text!) { response in
                        print("SUCCESS")
                        DispatchQueue.main.async {
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
            
        }
    }
}

