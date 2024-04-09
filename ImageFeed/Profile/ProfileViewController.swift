//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 20.03.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // profile pic
        let profileImage = UIImage(named: "profilePic")
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // profile pic constraints
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        // name label
        let nameLabel = UILabel()
        nameLabel.text = "Екатерина Новикова"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        // name label constraints
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 23),
            nameLabel.widthAnchor.constraint(equalToConstant: 235),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        // tag label
        let tagLabel = UILabel()
        tagLabel.text = "@ekaterina_nov"
        tagLabel.textColor = .gray
        tagLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tagLabel)
        
        // tag label constraints
        NSLayoutConstraint.activate([
            tagLabel.heightAnchor.constraint(equalToConstant: 18),
            tagLabel.widthAnchor.constraint(equalToConstant: 99),
            tagLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            tagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        // bio label
        let bioLabel = UILabel()
        bioLabel.text = "Hello, world!"
        bioLabel.textColor = .white
        bioLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        // bio label constraints
        NSLayoutConstraint.activate([
            bioLabel.heightAnchor.constraint(equalToConstant: 18),
            bioLabel.widthAnchor.constraint(equalToConstant: 77),
            bioLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 206),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        // logout button
        let logoutButton = UIButton()
        let logoutImage = UIImage(named: "logout_button")
        logoutButton.setImage(logoutImage, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        // logout button constraints
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: 24),
            logoutButton.widthAnchor.constraint(equalToConstant: 24),
            logoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 327)
        ])
    }
}
