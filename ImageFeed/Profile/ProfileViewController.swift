//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 20.03.2024.
//

import Foundation
import UIKit
import Kingfisher
import WebKit

final class ProfileViewController: UIViewController {
    private let imageView = UIImageView()
    private let exitButton = UIButton()
    private let nameLabel = UILabel()
    private let nickNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let profileService = ProfileService.shared
    private let profileImageService = ProfileImageService.shared
    private let imagesListService = ImagesListService.shared
    private let profileLogoutService = ProfileLogoutService.shared
    
    private var profileImageServiceObserver: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageServiceObserver = NotificationCenter.default
            .addObserver(
                forName: ProfileImageService.didChangeNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                guard let self = self else { return }
                self.updateAvatar()
            }
        updateAvatar()
        
        guard let profileModel = profileService.profileModel else {
            print("Try to read: profileService.profileModel")
            return }
        setupView()
        updateView(data: profileModel)
    }
    
    @objc
    private func didTapButton() {
        showAlert()
    }
}

extension ProfileViewController {
    func showAlert() {
        let alert = UIAlertController(
            title: "Пока, пока!",
            message: "Уверены что хотите выйти?",
            preferredStyle: .alert
        )
        
        let yesAction = UIAlertAction(
            title: "Да",
            style: .default) { _ in
                alert.dismiss(animated: true)
                self.profileLogoutService.logout()
                
                guard let window = UIApplication.shared.windows.first else {
                    assertionFailure("confirmExit Invalid Configuration")
                    return
                }
                window.rootViewController = SplashViewController()
            }
        
        let noAction = UIAlertAction(
            title: "Нет",
            style: .default) { _ in
                alert.dismiss(animated: true)
            }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
}

extension ProfileViewController {
    func updateView(data: Profile) {
        nameLabel.text = data.name
        nickNameLabel.text = data.loginName
        descriptionLabel.text = data.bio
    }
    
    func updateAvatar() {
        guard let profileImageURL = ProfileImageService.shared.profileImageURL,
              let url = URL(string: profileImageURL)
        else { return }
        imageView.kf.setImage(with: url)
    }
}

extension ProfileViewController {
    private func  setupView() {
        view.backgroundColor = UIColor(named: "Background")
        profileImageConfig()
        logoutButtonConfig()
        nameLabelConfig()
        nickNameLabelConfig()
        descriptionLabelConfig()
    }
    
    private func profileImageConfig() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func logoutButtonConfig() {
        let logoutImage = UIImage(named: "logout_button")
        guard let logoutImage else { return }
        let logoutButton = UIButton.systemButton(
            with: logoutImage,
            target: self,
            action: #selector(Self.didTapButton)
        )
        logoutButton.tintColor = .red
        logoutButton.setImage(logoutImage, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.widthAnchor.constraint(equalToConstant: 24),
            logoutButton.heightAnchor.constraint(equalToConstant: 24),
            logoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 327),
            logoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
    
    private func nameLabelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)
        ])
    }
    
    private func nickNameLabelConfig() {
        nickNameLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        nickNameLabel.textColor = .gray
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nickNameLabel)
        
        NSLayoutConstraint.activate([
            nickNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nickNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func descriptionLabelConfig() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: nickNameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 8)
        ])
    }
}
