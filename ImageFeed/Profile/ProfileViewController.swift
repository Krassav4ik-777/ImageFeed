//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by KraSSavchiK on 30.01.2024.

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView()
        nameLabel()
        loginNameLabel()
        descriptionLabel()
        logoutButton()
        
    }
    
    // MARK: - Public Methods
    func avatarImageView() {
        let photo = UIImageView(frame: CGRect(x: 100, y: 100, width: 70, height: 70))
        photo.image = UIImage(named: "Photo")
        
        view.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            photo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func nameLabel() {
        let name = UILabel()
        
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        name.text = "Екатерина Новикова"
        name.textColor = .ypWhite
        name.font = UIFont.boldSystemFont(ofSize: 23)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110),
            name.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16)
        ])
    }
    
    func loginNameLabel() {
        let login = UILabel()
        
        view.addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        
        login.text = "@ekaterina_nov"
        login.textColor = .ypGray
        login.font = UIFont.systemFont(ofSize: 13)
        
        NSLayoutConstraint.activate([
            login.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            login.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 145),
            login.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16)
        ])
    }
    
    func descriptionLabel() {
        let logout = UILabel()
        
        view.addSubview(logout)
        logout.translatesAutoresizingMaskIntoConstraints = false
        
        logout.text = "Hello, World!"
        logout.textColor = .ypWhite
        logout.font = UIFont.systemFont(ofSize: 13)
        
        NSLayoutConstraint.activate([
            logout.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logout.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            logout.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 171)
        ])
    }
    
    func logoutButton() {
        let button = UIButton(type: .custom)
                button.frame = CGRect(x: 374, y: 103, width: 24, height: 24)
                button.setBackgroundImage(UIImage(named: "Exit"), for: .normal)
                button.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -24),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
        ])
    }
    
    // MARK: - IBActions
    @objc func didTapLogoutButton() { }
}

//MARK: - Extension
extension UIColor {
    static var ypGray: UIColor { UIColor(named: "YP Gray") ?? UIColor.gray }
    static var ypWhite: UIColor { UIColor(named: "YP White") ?? UIColor.white}
    static var  ypBlack: UIColor { UIColor(named: "YP Black") ?? UIColor.black}
}
