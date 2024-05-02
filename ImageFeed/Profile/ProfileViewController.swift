//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 20.03.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var profileImageView: UIImageView = {
        let profileImage = UIImage(named: "profilePic")
        let profileImageView = UIImageView(image: profileImage)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Екатерина Новикова"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private lazy var tagLabel: UILabel = {
        let tagLabel = UILabel()
        tagLabel.text = "@ekaterina_nov"
        tagLabel.textColor = .gray
        tagLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        return tagLabel
    }()
    
    private lazy var bioLabel: UILabel = {
        let bioLabel = UILabel()
        bioLabel.text = "Hello, world!"
        bioLabel.textColor = .white
        bioLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        return bioLabel
    }()
    
    private lazy var logoutButton: UIButton = {
        let logoutButton = UIButton()
        let logoutImage = UIImage(named: "logout_button")
        logoutButton.setImage(logoutImage, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        return logoutButton
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(tagLabel)
        view.addSubview(bioLabel)
        view.addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 23),
            nameLabel.widthAnchor.constraint(equalToConstant: 235),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            tagLabel.heightAnchor.constraint(equalToConstant: 18),
            tagLabel.widthAnchor.constraint(equalToConstant: 99),
            tagLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            tagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            bioLabel.heightAnchor.constraint(equalToConstant: 18),
            bioLabel.widthAnchor.constraint(equalToConstant: 77),
            bioLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 206),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.heightAnchor.constraint(equalToConstant: 24),
            logoutButton.widthAnchor.constraint(equalToConstant: 24),
            logoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 99),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 327)
        ])
    }
}
