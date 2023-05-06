//
//  ViewController.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 4/28/23.
//

import UIKit

class ViewController: UIViewController {

    let loginButton = UIButton()
    let signUpButton = UIButton()
    let textLabel = UILabel()
    let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        title = "Outfit of the Day"
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.setTitle("  Login  ", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = .leagueGothic(size: 20)
        loginButton.backgroundColor = .black
        loginButton.addTarget(self, action: #selector(pushLoginView), for: .touchUpInside)

        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        signUpButton.setTitle("  Create Account  ", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = .leagueGothic(size: 20)
        signUpButton.backgroundColor = .black
        signUpButton.addTarget(self, action: #selector(pushSignUpView), for: .touchUpInside)
        
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        textLabel.text = "OOTD"
        textLabel.textColor = .black
        textLabel.font = .leagueGothic(size: 80)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.text = "your personal outfit library."
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 24)
        
        setUpConstraints()
    }

    func setUpConstraints() {
        let width: CGFloat = 150
        let height: CGFloat = 45
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            textLabel.heightAnchor.constraint(equalToConstant: 96)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: width * 2),
            loginButton.widthAnchor.constraint(equalToConstant: width),
            loginButton.heightAnchor.constraint(equalToConstant: height)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: height),
            signUpButton.widthAnchor.constraint(equalToConstant: width),
            signUpButton.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    
    @objc func pushLoginView() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func pushSignUpView() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIFont {
    static func leagueGothic(size: CGFloat) -> UIFont? {
        return UIFont(name: "league-gothic.regular", size: size) ?? .systemFont(ofSize: size)
    }
}
